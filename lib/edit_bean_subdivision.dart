import 'package:bean_cellar/components/text_input.dart';
import 'package:bean_cellar/redux/actions.dart';
import 'package:bean_cellar/redux/utils.dart';
import 'package:flutter/material.dart';

class EditBeanSubdivision extends StatefulWidget {
  final String beanId;
  final String subdivisionId;

  const EditBeanSubdivision(this.beanId, this.subdivisionId, {super.key});

  @override
  State<EditBeanSubdivision> createState() => _EditBeanSubdivisionState();
}

class _EditBeanSubdivisionState extends State<EditBeanSubdivision> {
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dispatch = useDispatch(context);
    return storeConnector(
      onInit: (state) {
        final weight = state.beans[widget.beanId]?.subdivisions[widget.subdivisionId]?.weight;
        if (weight != null) weightController.text = weight.toString();
      },
      builder: (state) {
        final subdivision = state.beans[widget.beanId]!.subdivisions[widget.subdivisionId]!;
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              Expanded(
                child: StyledTextField(
                  TextField(
                    controller: weightController,
                    onChanged: (value) {
                      final parsedValue = int.tryParse(value);
                      if (parsedValue == null) return;

                      dispatch(
                        UpdateBeanSubdivision(
                          widget.beanId,
                          widget.subdivisionId,
                          subdivision.rebuild((b) => b..weight = parsedValue),
                        ),
                      );
                    },
                    decoration: const InputDecoration(
                      suffixText: 'g',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 17),
              IconButton(
                onPressed: () {
                  if (subdivision.count > 0) {
                    dispatch(
                      UpdateBeanSubdivision(
                        widget.beanId,
                        widget.subdivisionId,
                        subdivision.rebuild((b) => b..count = subdivision.count - 1),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.remove),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text('${subdivision.count}', style: const TextStyle(fontSize: 18)),
              ),
              IconButton(
                onPressed: () {
                  dispatch(
                    UpdateBeanSubdivision(
                      widget.beanId,
                      widget.subdivisionId,
                      subdivision.rebuild((b) => b..count = subdivision.count + 1),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        );
      },
    );
  }
}
