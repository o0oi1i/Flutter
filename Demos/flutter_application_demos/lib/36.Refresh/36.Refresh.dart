import 'package:flutter/material.dart';

import 'routes/Routes.dart';

class Refresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
