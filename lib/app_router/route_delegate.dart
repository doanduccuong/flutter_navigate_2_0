//
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigate_2_0/ui/create_account.dart';
import 'package:flutter_navigate_2_0/ui/splash_screen.dart';

import '../app_state.dart';
import '../enum.dart';
import '../page_action.dart';
import '../page_configuration.dart';
import '../page_configuration_constant.dart';
import '../ui/log_in.dart';

class ShoppingRouterDelegate extends RouterDelegate<PageConfiguration> //
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<PageConfiguration> {
  //
  final List<MaterialPage> _pages = [];

  //
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  //
  final AppState appState;

  //
  ShoppingRouterDelegate(this.appState) : navigatorKey = GlobalKey() {
    appState.addListener(() {
      notifyListeners();
    });
  }

  //
  /// Getter for a list that cannot be changed
  List<MaterialPage> get pages => List.unmodifiable(_pages);

  /// Number of pages function
  int numPages() => _pages.length;

//
  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: buildPages(),
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            configuration.uiPage;
    if (shouldAddPage) {
      _pages.clear();
      addPage(configuration);
    }
    return SynchronousFuture(null);
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  bool _onPopPage(Route<dynamic> route, result) {
    //
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void pop() {
    if (canPop()) {
      _removePage(_pages.last);
    }
  }

  bool canPop() {
    return _pages.length > 1;
  }

  void _removePage(MaterialPage page) {
    _pages.remove(page);
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        // key: Key(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void addPage(PageConfiguration pageConfig) {
    // 1
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig.uiPage;

    if (shouldAddPage) {
      // 2
      switch (pageConfig.uiPage) {
        case Pages.Splash:
          _addPageData(Splash(), SplashPageConfig);
          break;
        case Pages.Login:
          _addPageData(LogIn(), LoginPageConfig);
          break;
        case Pages.CreateAccount:
          _addPageData(CreateAccount(), CreateAccountPageConfig);
          break;

        case Pages.Details:
          if (pageConfig.currentPageAction != null) {
            _addPageData(
                pageConfig.currentPageAction?.widget ?? const SizedBox(),
                pageConfig);
          }
          break;
        default:
          break;
      }
    }
  }

  void _setPageAction(PageAction action) {
    switch (action.page?.uiPage) {
      case Pages.Splash:
        SplashPageConfig.currentPageAction = action;
        break;
      case Pages.Login:
        LoginPageConfig.currentPageAction = action;
        break;
      case Pages.CreateAccount:
        CreateAccountPageConfig.currentPageAction = action;
        break;
      case Pages.List:
        ListItemsPageConfig.currentPageAction = action;
        break;
      case Pages.Cart:
        CartPageConfig.currentPageAction = action;
        break;
      case Pages.Checkout:
        CheckoutPageConfig.currentPageAction = action;
        break;
      case Pages.Settings:
        SettingsPageConfig.currentPageAction = action;
        break;
      case Pages.Details:
        DetailsPageConfig.currentPageAction = action;
        break;
      default:
        break;
    }
  }

  List<Page> buildPages() {
    // 1
    if (!appState.splashFinished) {
      // replaceAll(SplashPageConfig);
    } else {
      // 2
      switch (appState.currentAction.state) {
        // 3
        case PageState.none:
          break;
        case PageState.addPage:
          // 4
          _setPageAction(appState.currentAction);
          addPage(appState.currentAction.page ?? UnknownPageConfig);
          break;
        case PageState.pop:
          // 5
          pop();
          break;
        case PageState.replace:
          // 6
          _setPageAction(appState.currentAction);
          // replace(appState.currentAction.page);
          break;
        case PageState.replaceAll:
          // 7
          _setPageAction(appState.currentAction);
          // replaceAll(appState.currentAction.page);
          break;
        case PageState.addWidget:
          // 8
          _setPageAction(appState.currentAction);
          // pushWidget(appState.currentAction.widget, appState.currentAction.page);
          break;
        case PageState.addAll:
          // 9
          //   addAll(appState.currentAction.pages);
          break;
      }
    }
    // 10
    appState.resetCurrentAction();
    return List.of(_pages);
  }
}
