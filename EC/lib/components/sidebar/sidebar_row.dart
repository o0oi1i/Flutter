import 'package:flutter/material.dart';

import '../../model/sidebar_model.dart';

import '../../themes/ec_theme.dart';

class SidebarRow extends StatelessWidget {
  SidebarRow({@required this.item});

  final SidebarItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          padding: EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: item.background,
          ),
          child: item.icon,
        ),
        SizedBox(width: 8),
        Container(
          child: Text(item.title, style: ECTheme.darkTextTheme.headline3),
        ),
      ],
    );
  }
}
