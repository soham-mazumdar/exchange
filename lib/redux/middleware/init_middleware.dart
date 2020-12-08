import 'package:exchange/redux/actions/action.dart';
import 'package:exchange/redux/actions/exchange.dart';
import 'package:exchange/redux/models/app_state.dart';
import 'package:exchange/redux/services/exchange.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createInitMiddleware(
  ExchangeApiService exchangeApiService
){
	return[
	  TypedMiddleware<AppState, InitAppAction>(_init(exchangeApiService)),
    TypedMiddleware<AppState, ChangeBasesAction>(_changeBases(exchangeApiService)),
  ];
}

void Function(Store<AppState> store, InitAppAction action, NextDispatcher next)
_init(ExchangeApiService exchangeApiService) {
  	return (store, action, next) {

      exchangeApiService.getAll().then((value) {
        store.dispatch(new SavedRateAction(value));
        store.dispatch(new AllLoadedAction());
      });
      
    	next(action);
	};
}


void Function(Store<AppState> store, ChangeBasesAction action, NextDispatcher next)
_changeBases(ExchangeApiService exchangeApiService) {
  	return (store, action, next) {
      exchangeApiService.changeBase(action.base).then((value) {
        store.dispatch(new SavedRateAction(value));
        store.dispatch(new AllLoadedAction());
      });

    	next(action);
	};
}