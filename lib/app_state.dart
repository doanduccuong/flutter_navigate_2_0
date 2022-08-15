import 'package:flutter/cupertino.dart';
import 'package:flutter_navigate_2_0/page_action.dart';
import 'package:flutter_navigate_2_0/page_configuration_constant.dart';
import 'enum.dart';

class AppState extends ChangeNotifier {
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;
  bool _splashFinished = false;

  bool get splashFinished => _splashFinished;
  final cartItems = [];
  String? emailAddress;
  String? password;
  PageAction _currentAction = PageAction();

  PageAction get currentAction => _currentAction;

  set currentAction(PageAction action) {
    _currentAction = action;
    notifyListeners();
  }

  AppState() {
    getLoggedInState();
  }

  void resetCurrentAction() {
    _currentAction = PageAction();
  }

  void addToCart(String item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(String item) {
    cartItems.add(item);
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  void setSplashFinished() {
    _splashFinished = true;
    if (_loggedIn) {
      _currentAction =
          PageAction(state: PageState.replaceAll, page: ListItemsPageConfig);
    } else {
      _currentAction =
          PageAction(state: PageState.replaceAll, page: LoginPageConfig);
    }
    notifyListeners();
  }

  void login() {
    _loggedIn = true;
    saveLoginState(loggedIn);
    _currentAction =
        PageAction(state: PageState.replaceAll, page: ListItemsPageConfig);
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    saveLoginState(loggedIn);
    _currentAction =
        PageAction(state: PageState.replaceAll, page: LoginPageConfig);
    notifyListeners();
  }

//TODO handle save login sate and get login state
  void saveLoginState(bool loggedIn) {}

  void getLoggedInState() {}
// void saveLoginState(bool loggedIn) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setBool(LoggedInKey, loggedIn);
// }
//
// void getLoggedInState() async {
//   final prefs = await SharedPreferences.getInstance();
//   _loggedIn = prefs.getBool(LoggedInKey);
//   if (_loggedIn == null) {
//     _loggedIn = false;
//   }
// }
}
