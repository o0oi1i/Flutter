import 'package:flutter/material.dart';

import '../../model/sidebar_model.dart';

class SidebarRow extends StatelessWidget {
  SidebarRow({@required this.item});

  final SidebarItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34.0,
          height: 35.0,
          padding: EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.0),
            gradient: item.background,
          ),
          child: item.icon,
        ),
        SizedBox(width: 10),
        Container(
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
