import 'package:bean_cellar/app_colors.dart';
import 'package:bean_cellar/components/bean_avatar.dart';
import 'package:bean_cellar/edit_bean_view.dart';
import 'package:flutter/material.dart';

import '../redux/utils.dart';

class BeanListItem extends StatelessWidget {
  final String beanId;

  const BeanListItem(
    this.beanId, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return storeConnector(builder: (store) {
      final bean = store.beans[beanId]!;

      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
          color: AppColors.card,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => EditBeanView(beanId)));
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  BeanAvatar(beanId),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          bean.name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          bean.roaster,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '500g / 2267g',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // child: ListTile(
          //   leading: CircleAvatar(
          //     radius: 72 / 2,
          //     backgroundColor: Colors.green,
          //   ),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (_) => EditBeanView(bean)));
          //   },
          //   title: Text(bean.name),
          //   subtitle: Text(bean.roaster),
          // ),
        ),
      );
    });
  }
}
