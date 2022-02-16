import 'package:flutter/material.dart';

import 'Home.dart';
import 'Category.dart';
import 'Setting.dart';

class Tabs extends StatefulWidget {
  final index;

  Tabs({Key key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  List _pageList = [
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];

  int _currentIndex;

  _TabsState(this._currentIndex); //构造函数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Replace"),
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
          )
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
    );
  }
}
