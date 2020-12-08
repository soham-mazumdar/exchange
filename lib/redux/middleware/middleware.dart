import 'package:flutter/material.dart';
import 'package:exchange/redux/middleware/init_middleware.dart';
import 'package:exchange/redux/middleware/navigation_middleware.dart';
import 'package:exchange/redux/models/app_state.dart';
import 'package:exchange/redux/services/exchange.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleWare(
  GlobalKey<NavigatorState> navigatorKey,
  ExchangeApiService exchangeApiService,
)
{
  return [
    ...createInitMiddleware(exchangeApiService),
    ...createNavigationMiddleware(navigatorKey),
  ];
}