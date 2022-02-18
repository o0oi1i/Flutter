import 'package:flutter/material.dart';

import '../tabs/Tab.dart';

import '../navs/AppBar.dart';

final Map<String, Function> routes = {
  '/': (context) => Tabs(),
  '/appBar': (context) => AppBarPage(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments),
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context),
      );
      return route;
    }
  }
};
