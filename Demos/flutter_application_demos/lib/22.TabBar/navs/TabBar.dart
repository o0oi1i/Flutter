import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  TabBarPage({Key key}) : super(key: key);

  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBar"),
        bottom: TabBar(
          controller: this._tabController, //注意
          tabs: <Widget>[
            Tab(text: "Hot"),
            Tab(text: "Recommend"),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController, //注意
        children: <Widget>[
          Center(
            child: Text(
              "Hot",
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
          Center(
            child: Text(
              "Recommend",
              style: TextStyle(color: Colors.lightBlue),
            ),
          )
        ],
      ),
    );
  }
}
