import 'package:bean_cellar/edit_bean_view.dart';
import 'package:bean_cellar/models/bean.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bean Cellar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Bean> _beans = [
    Bean(
      roaster: 'Revel',
      name: 'Columbian Urrao',
      roastDate: DateTime.now(),
    ),
    Bean(
      roaster: 'Revel',
      name: 'Columbian Urrao',
      roastDate: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _beans.map((bean) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
              ),
              trailing: Text('%30'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => EditBeanView(bean)));
              },
              title: Text(bean.name),
              subtitle: Text(bean.roaster),
            ),
          );
        }).toList(),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
