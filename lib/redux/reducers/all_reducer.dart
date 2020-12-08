import 'package:exchange/redux/actions/action.dart';
import 'package:exchange/redux/actions/exchange.dart';
import 'package:exchange/redux/models/rate.dart';
import 'package:redux/redux.dart';


final loadingReducer = combineReducers<bool>([
  new TypedReducer<bool, AllLoadedAction>(_isLoading),
  new TypedReducer<bool, SetLoadingAction>(_setLoading),
]);

bool _isLoading(bool meds, AllLoadedAction action) {
  return false;
}

bool _setLoading(bool meds, SetLoadingAction action) {
  return true;
}

final rateReducer = combineReducers<Rate>([
  new TypedReducer<Rate, SavedRateAction>(_saveRate),
]);

Rate _saveRate(Rate meds, SavedRateAction action) {
  return action.rate;
}
