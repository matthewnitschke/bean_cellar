import 'package:bean_cellar/models/app_state.sg.dart';
import 'package:bean_cellar/redux/actions.dart';
import 'package:redux/redux.dart';

Reducer<AppState> get appReducer => combineReducers([
      TypedReducer(_onUpdateBean),
      TypedReducer(_onUpdateBeanSubdivision),
    ]);

AppState _onUpdateBean(AppState state, UpdateBean action) {
  return state.rebuild((b) => b..beans[action.beanId] = action.bean);
}

AppState _onUpdateBeanSubdivision(AppState state, UpdateBeanSubdivision action) {
  final newBean = state.beans[action.beanId]!.rebuild(
    (b) => b.subdivisions[action.subdivisionId] = action.subdivision,
  );

  return state.rebuild((b) => b..beans[action.beanId] = newBean);
}
