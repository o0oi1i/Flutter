import 'package:flutter/material.dart';

import 'routes/Routes.dart';

class Replace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
