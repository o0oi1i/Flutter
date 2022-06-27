import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/category.dart';
import '../screens/sidebar_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: _selectedIndex);
  }

  static List<Widget> pages = <Widget>[
    Home(),
    Category(),
    SidebarScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '分类',
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
