import 'package:flutter/material.dart';

import '../screens/card1.dart';
// import '../screens/card2.dart';
// import '../screens/card3.dart';

import '../screens/sidebar_screen.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    Card1(),
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
      // appBar: AppBar(
      //   title: Text(
      //     'EC',
      //     style: Theme.of(context).textTheme.headline1,
      //   ),
      //   backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      // ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: '专题',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_day),
            label: '统计',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: '收藏',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: '购物',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: '购物',
          ),
        ],
      ),
    );
  }
}
