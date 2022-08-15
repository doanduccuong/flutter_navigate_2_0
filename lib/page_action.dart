import 'package:flutter/cupertino.dart';
import 'package:flutter_navigate_2_0/page_configuration.dart';

import 'enum.dart';

class PageAction {
  PageState state;
  PageConfiguration? page;
  List<PageConfiguration>? pages;
  Widget? widget;

  PageAction({
    this.state = PageState.none,
    this.page,
    this.pages,
    this.widget,
  });
}
