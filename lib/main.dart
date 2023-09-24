import 'package:bean_cellar/app_colors.dart';
import 'package:bean_cellar/components/bean_list_item.dart';
import 'package:bean_cellar/models/app_state.sg.dart';
import 'package:bean_cellar/models/bean.sg.dart';
import 'package:bean_cellar/redux/app_reducer.dart';
import 'package:bean_cellar/redux/utils.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState(
        (b) => b
          ..beans = MapBuilder<String, Bean>({
            '1': Bean(
              (bb) => bb
                ..name = 'Tropical Weather'
                ..roaster = 'Onyx'
                ..roastDate = DateTime.now(),
            )
          }),
      ),
    );

    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.inter().fontFamily,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF22272E),
          inputDecorationTheme: const InputDecorationTheme(
            iconColor: Color(0xFF6272A4),
            contentPadding: EdgeInsets.symmetric(vertical: 23, horizontal: 14),
            filled: true,
            fillColor: AppColors.card,
            border: InputBorder.none,
          ),
        ),
        home: const MyHomePage(title: 'Bean Cellar'),
      ),
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
  @override
  Widget build(BuildContext context) {
    return storeConnector(builder: (store) {
      return Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: store.beans.keys.map((id) => BeanListItem(id)).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          backgroundColor: AppColors.green,
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
