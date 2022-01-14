import 'package:flutter/material.dart';

import '../../themes/ec_theme.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 24.0,
              backgroundImage: AssetImage('asset/images/profile.jpg'),
            ),
            SearchField(),
            Notification(),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 0, left: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(0, 1),
                blurRadius: 0.0,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              cursorColor: ECTheme.darkTextTheme.headline1.color,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 22.0,
                ),
                border: InputBorder.none,
                hintText: "Search for courses",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              style: TextStyle(color: Colors.black, fontSize: 16),
              onChanged: (newText) {
                print(newText);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Notification extends StatelessWidget {
  const Notification({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print("Sidebar button pressed");
      },
      // materialTapTargetSize: MaterialTapTargetSize.padded,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(
        maxWidth: 40.0,
        maxHeight: 40.0,
      ),
      child: Icon(
        Icons.notifications,
        color: Colors.white,
      ),
    );
  }
}
