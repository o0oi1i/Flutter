import 'package:flutter/material.dart';

import '../themes/ec_theme.dart';
import '../model/sidebar_model.dart';

import '../components/author/author_card.dart';
import '../components/sidebar/sidebar_row.dart';

class SidebarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
        ),
      ),
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      child: SafeArea(
        child: Column(
          children: [
            AuthorCard(
              authorName: 'o0oi1i',
              title: 'Hello world ! ',
              imageProvider: AssetImage('asset/images/profile.jpg'),
            ),
            SizedBox(
              height: 30,
            ),
            SidebarRow(
              item: sidebarItem[0],
            ),
            SizedBox(
              height: 15.0,
            ),
            SidebarRow(
              item: sidebarItem[1],
            ),
            SizedBox(
              height: 15.0,
            ),
            SidebarRow(
              item: sidebarItem[2],
            ),
            SizedBox(
              height: 15.0,
            ),
            SidebarRow(
              item: sidebarItem[3],
            ),
            Spacer(),
            Row(
              children: [
                Image.asset(
                  'asset/icons/icon-logout.png',
                  width: 15.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  "退出",
                  style: ECTheme.darkTextTheme.headline3,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
