import 'package:flutter/material.dart';
import 'package:flutter_navigate_2_0/page_action.dart';

import 'enum.dart';

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;
  PageAction? currentPageAction;

  PageConfiguration({
    required this.key,
    required this.path,
    required this.uiPage,
    required this.currentPageAction,
  });
}
