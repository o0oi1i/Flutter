import 'package:flutter/material.dart';

import '../components/sidebar/sidebar_row.dart';
import '../components/author/author_card.dart';

import '../model/sidebar_model.dart';

class SidebarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.65,
      padding: EdgeInsets.symmetric(
        vertical: 35.0,
        horizontal: 20.0,
      ),
      child: SafeArea(
        child: Column(
          children: [
            AuthorCard(
              authorName: 'Mike Katz',
              title: 'Smoothie Connoisseur',
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
            SizedBox(
              height: 32.0,
            ),
            Spacer(),
            Row(
              children: [
                Image.asset(
                  'asset/icons/icon-logout.png',
                  width: 16.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "退出",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
