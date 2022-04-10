import 'package:flutter/material.dart';

import '../screens/home.dart';
// import '../screens/card2.dart';
// import '../screens/card3.dart';

import '../screens/sidebar_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    Home(),
    SidebarScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: '发现',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '分类',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: '成就',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '学习',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
