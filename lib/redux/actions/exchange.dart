import 'package:exchange/redux/actions/action.dart';
import 'package:exchange/redux/models/rate.dart';

class SavedRateAction extends AppAction{

  final Rate rate;
  SavedRateAction(this.rate);

  @override String toString() => "SavedRateAction{$rate}";
}

class ChangeBasesAction extends AppAction{

  final String base;
  ChangeBasesAction(this.base);

  @override String toString() => "ChangeBasesAction{$base}";
}