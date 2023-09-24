import 'package:bean_cellar/models/app_state.sg.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

typedef DispatchFunction = dynamic Function(dynamic);

StoreConnector storeConnector({
  required Widget Function(AppState) builder,
  void Function(AppState)? onInit,
}) {
  return StoreConnector<AppState, AppState>(
    converter: (store) => store.state,
    builder: (ctx, val) => builder(val),
    onInit: onInit != null ? (store) => onInit(store.state) : null,
  );
}

StoreConnector storeConnectorWithConverter<T>(
    {required T Function(AppState) converter, required Widget Function(T) builder}) {
  return StoreConnector<AppState, T>(
    converter: (store) => converter(store.state),
    builder: (ctx, val) => builder(val),
  );
}

DispatchFunction useDispatch(BuildContext context) => StoreProvider.of<AppState>(context).dispatch;
