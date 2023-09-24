import 'package:bean_cellar/app_colors.dart';
import 'package:bean_cellar/components/bean_avatar.dart';
import 'package:bean_cellar/components/text_input.dart';
import 'package:bean_cellar/edit_bean_subdivision.dart';
import 'package:bean_cellar/models/bean.sg.dart';
import 'package:bean_cellar/redux/actions.dart';
import 'package:bean_cellar/redux/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class EditBeanView extends StatefulWidget {
  final String beanId;

  const EditBeanView(
    this.beanId, {
    super.key,
  });

  @override
  State<EditBeanView> createState() => _EditBeanViewState();
}

class _EditBeanViewState extends State<EditBeanView> {
  final nameFieldController = TextEditingController(text: 'Columbian');
  final revelFieldController = TextEditingController(text: 'Revel');

  @override
  Widget build(BuildContext context) {
    final dispatch = useDispatch(context);
    return storeConnector(builder: (store) {
      final bean = store.beans[widget.beanId]!;
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 124,
          backgroundColor: AppColors.card,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                BeanAvatar(widget.beanId),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        bean.name,
                        style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        bean.roaster,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Subdivisions',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 15),
                    ...bean.subdivisions.keys.map((subdivId) => EditBeanSubdivision(widget.beanId, subdivId)).toList(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            dispatch(UpdateBean(
                              widget.beanId,
                              bean.rebuild(
                                (b) => b..subdivisions[uuid.v4()] = BeanSubdivision((b) => b..count = 1),
                              ),
                            ));
                          },
                        )
                      ],
                    ),
                    StyledTextField(
                      TextField(
                        readOnly: true,
                        controller: TextEditingController(
                          text: bean.roastDate != null ? DateFormat.yMd().format(bean.roastDate!) : null,
                        ),
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: bean.roastDate ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          ).then((date) {
                            if (date == null) return;
                            dispatch(UpdateBean(
                              widget.beanId,
                              bean.rebuild((b) => b..roastDate = date),
                            ));
                          });
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                      label: 'Roast Date',
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       ElevatedButton(
              //         style: const ButtonStyle(
              //           fixedSize: MaterialStatePropertyAll(Size(150, 50)),
              //           backgroundColor: MaterialStatePropertyAll(Color(0xFF787C83)),
              //         ),
              //         child: const Text(
              //           'Cancel',
              //           style: TextStyle(fontSize: 18),
              //         ),
              //         onPressed: () => Navigator.pop(context),
              //       ),
              //       const SizedBox(width: 15),
              //       ElevatedButton(
              //         style: const ButtonStyle(
              //           fixedSize: MaterialStatePropertyAll(Size(150, 50)),
              //           foregroundColor: MaterialStatePropertyAll(Color(0xFF22272E)),
              //           backgroundColor: MaterialStatePropertyAll(AppColors.green),
              //         ),
              //         child: const Text(
              //           'Save',
              //           style: TextStyle(fontSize: 18),
              //         ),
              //         onPressed: () {},
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      );
    });
  }
}
