import 'package:flutter_navigate_2_0/page_configuration.dart';
import 'package:flutter_navigate_2_0/settup/page_settup.dart';

import 'enum.dart';

PageConfiguration SplashPageConfig = PageConfiguration(
  key: 'Splash',
  path: SplashPath,
  uiPage: Pages.Splash,
  currentPageAction: null,
);
PageConfiguration LoginPageConfig = PageConfiguration(
  key: 'Login',
  path: LoginPath,
  uiPage: Pages.Login,
  currentPageAction: null,
);
PageConfiguration CreateAccountPageConfig = PageConfiguration(
  key: 'CreateAccount',
  path: CreateAccountPath,
  uiPage: Pages.CreateAccount,
  currentPageAction: null,
);
PageConfiguration ListItemsPageConfig = PageConfiguration(
  key: 'ListItems',
  path: ListItemsPath,
  uiPage: Pages.List,
  currentPageAction: null,
);
PageConfiguration DetailsPageConfig = PageConfiguration(
  key: 'Details',
  path: DetailsPath,
  uiPage: Pages.Details,
  currentPageAction: null,
);
PageConfiguration CartPageConfig = PageConfiguration(
  key: 'Cart',
  path: CartPath,
  uiPage: Pages.Cart,
  currentPageAction: null,
);
PageConfiguration CheckoutPageConfig = PageConfiguration(
  key: 'Checkout',
  path: CheckoutPath,
  uiPage: Pages.Checkout,
  currentPageAction: null,
);
PageConfiguration SettingsPageConfig = PageConfiguration(
  key: 'Settings',
  path: SettingsPath,
  uiPage: Pages.Settings,
  currentPageAction: null,
);
PageConfiguration UnknownPageConfig = PageConfiguration(
  key: 'Settings',
  path: UnknownPath,
  uiPage: Pages.Settings,
  currentPageAction: null,
);
