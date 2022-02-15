import 'package:flutter/material.dart';

import 'Home.dart';
import 'Category.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List _pageList = [
    HomePage(),
    CategoryPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Route"),
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
