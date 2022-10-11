import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'models/bean.dart';

class EditBeanView extends StatefulWidget {
  final Bean bean;

  const EditBeanView(this.bean, {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bean.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 50,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: nameFieldController,
                          decoration: InputDecoration(
                            label: Text('Name')
                          ),
                        ),
                        TextField(
                          controller: revelFieldController,
                          decoration: InputDecoration(
                            label: Text('Roaster')
                          ),
                        )
                      ]
                    ),
                  ),
                ),
              ],
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(label: Text('Roast Date')),
                  )
                ],),
              )
            )
            
          ],
        ),
      ),
    );
  }
}