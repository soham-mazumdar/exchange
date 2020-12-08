abstract class AppAction{}

class InitAppAction extends AppAction {

  InitAppAction();

  @override @override String toString() {
    return "InitAppAction";
  }
}

class SetLoadingAction extends AppAction {

  SetLoadingAction();

  @override @override String toString() {
    return "SetLoadingAction";
  }
}

class AllLoadedAction extends AppAction {

  AllLoadedAction();

  @override @override String toString() {
    return "AllLoadedAction";
  }
}
