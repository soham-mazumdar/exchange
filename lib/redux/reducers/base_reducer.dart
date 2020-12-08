
import 'package:exchange/redux/models/app_state.dart';
import 'package:exchange/redux/reducers/navigation_reducer.dart';
import 'package:exchange/redux/reducers/all_reducer.dart';

AppState baseReducer(AppState oldState, dynamic action)
{
  return oldState.copyWith(
    newRoutes: navigationReducer(oldState.routes, action),
    newIsLoading: loadingReducer(oldState.isLoading, action),
    newCurrentRate: rateReducer(oldState.currentRate, action),
  );
}