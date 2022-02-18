import 'package:flutter/material.dart';

import 'Home.dart';
import 'Category.dart';
import 'Setting.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Tab Bar"),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        iconSize: 32.0,
        fixedColor: Colors.lightBlueAccent,
        type: BottomNavigationBarType.fixed,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: UserAccountsDrawerHeader(
                    accountName: Text("o0oi1i"),
                    accountEmail: Text("o0oi1i@o0oi1i.io"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://www.itying.com/images/flutter/3.png",
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://www.itying.com/images/flutter/2.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    otherAccountsPictures: <Widget>[
                      Image.network(
                        "https://www.itying.com/images/flutter/4.png",
                      ),
                      Image.network(
                        "https://www.itying.com/images/flutter/5.png",
                      ),
                    ],
                  ),
                )
              ],
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text("Zone"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.people)),
              title: Text("User"),
              onTap: () {
                Navigator.of(context).pop(); //隐藏侧边栏
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("Setting"),
            ),
            Divider(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Text(
            'Drawer',
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}
