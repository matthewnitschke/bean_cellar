import 'package:bean_cellar/models/bean.sg.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'app_state.sg.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltMap<String, Bean> get beans;

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
  AppState._();
}
