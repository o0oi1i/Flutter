import 'package:flutter/material.dart';

import '../tabs/Tabs.dart';

import '../pages/News.dart';
import '../pages/NewsContent.dart';

final Map<String, Function> routes = {
  '/': (context) => Tabs(),
  '/news': (context) => News(),
  '/newscontent': (context, {arguments}) => NewsContent(arguments: arguments),
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
