import 'package:flutter/material.dart';
import 'package:mine/architecture/home.dart';

import 'themes/ec_theme.dart';

void main() {
  runApp(EC());
}

class EC extends StatelessWidget {
  const EC({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ECTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'EC',
      home: Home(),
    );
  }
}