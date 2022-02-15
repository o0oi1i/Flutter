import 'package:flutter/material.dart';

import 'routes/Routes.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute,
    );
  }
}
