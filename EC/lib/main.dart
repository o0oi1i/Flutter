import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'themes/ec_theme.dart';
import 'routers/router.dart';

void main() {
  runApp(EC());
}

class EC extends StatelessWidget {
  const EC({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ECTheme.dark();
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () => MaterialApp(
        title: 'EC',
        theme: theme,
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
