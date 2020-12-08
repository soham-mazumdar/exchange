import 'package:exchange/redux/models/rate.dart';
import 'package:exchange/redux/routes/routes.dart';

class AppState {
  final bool isLoading;
  final List<String> routes;
  final Rate currentRate;
  final String baseCurrency; // baseCurrency
  

  AppState({
    this.isLoading,
    this.routes,
    this.currentRate,
    this.baseCurrency
  });

  factory AppState.initial(){
    return AppState(
      isLoading: true,
      routes: [AppRoutes.home],
      currentRate: Rate(),
      baseCurrency: 'USD'
    );
  }

  AppState copyWith({
    bool newIsLoading,
    List<String> newRoutes,
    Rate newCurrentRate,
    String newBaseCurrency
  })
  {
    return AppState(
      isLoading: newIsLoading ?? this.isLoading,
      routes: newRoutes ?? this.routes,
      currentRate: newCurrentRate ?? this.currentRate,
      baseCurrency: newBaseCurrency ?? this.baseCurrency
    );
  }
}