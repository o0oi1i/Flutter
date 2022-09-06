import 'package:flutter/material.dart';

import '../architecture/tabs.dart';
import '../pages/Lessons.dart';
import '../pages/search.dart';

final Map<String, Function> routes = {
  '/': (context) => Tabs(),
  '/search': (context) => Search(),
  '/lessons': (context, {arguments}) => Lessons(arguments: arguments),
};

// ignore: missing_return
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(
          context,
          arguments: settings.arguments,
        ),
      );
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
