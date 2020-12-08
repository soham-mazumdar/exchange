import 'package:exchange/redux/services/exchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:exchange/redux/actions/action.dart';
import 'package:exchange/redux/middleware/middleware.dart';
import 'package:exchange/redux/models/app_state.dart';
import 'package:exchange/redux/reducers/base_reducer.dart';
import 'package:exchange/redux/routes/routes.dart';
import 'package:exchange/ui/HomePage.dart';
import 'package:exchange/utils/ui_constants.dart';
import 'package:redux/redux.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // final SharedPreferences preferences = await SharedPreferences.getInstance();
  
  final Store<AppState> store = Store<AppState>(
    baseReducer,
    initialState: AppState.initial(),

    middleware: createMiddleWare(
      navigatorKey,
      ExchangeApiService(),
    )
  );
  store.dispatch(InitAppAction());
  return runApp(Quotes(store));
}

class Quotes extends StatelessWidget {
  
  final Store<AppState> store;

  Quotes(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<AppState, Map<String, dynamic>>(
        converter: (store)
        {
          final Map<String, dynamic> args = {
            // "ui": store.state.ui,
            // "services" : store.state.services,
            // "doctors" : store.state.doctors,
          };
          return args;
        },
        builder: (context, args){
          return MaterialApp(
            initialRoute: '/',
            debugShowCheckedModeBanner : false,
            navigatorKey:navigatorKey,
            navigatorObservers: [routeObserver],
            theme: getThemeData(),
            onGenerateRoute: (RouteSettings settings) => _resolveRoute(settings),
          );
        }
      )
      
      
    );
  }

  PageRoute _resolveRoute(RouteSettings settings)
	{
    
		switch(settings.name)
		{
			case AppRoutes.home:
          return FabRoute(HomePage(), settings: settings,duration: 500,direction: 'bottom');
      default :
        return MainRoute(HomePage(), settings : settings,);
        
		}
	}

}