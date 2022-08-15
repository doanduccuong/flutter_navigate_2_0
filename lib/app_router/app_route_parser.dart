import 'package:flutter/material.dart';
import 'package:flutter_navigate_2_0/page_configuration_constant.dart';

import '../page_configuration.dart';
import '../settup/page_settup.dart';

class ShoppingParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    // 1
    final uri = Uri.parse(routeInformation.location ?? "");
    // 2
    if (uri.pathSegments.isEmpty) {
      return SplashPageConfig;
    }

    // 3
    final path = uri.pathSegments[0];
    // 4
    switch (path) {
      case SplashPath:
        return SplashPageConfig;
      case LoginPath:
        return LoginPageConfig;
      case CreateAccountPath:
        return CreateAccountPageConfig;

      default:
        return UnknownPageConfig;
    }
  }
}
