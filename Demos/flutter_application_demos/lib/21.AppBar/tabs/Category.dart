import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TabBar(
                  indicatorColor: Colors.lightBlueAccent,
                  labelColor: Colors.lightBlueAccent,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(text: "News"),
                    Tab(text: "Sports"),
                    Tab(text: "Finance"),
                    Tab(text: "Travel")
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "News 1",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                ListTile(
                  title: Text(
                    "News 2",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                ListTile(
                  title: Text(
                    "News 3",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Sports 1",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Sports 2",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Sports 3",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Finance 1",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Finance 2",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Finance 3",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Travel 1",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Travel 2",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Travel 3",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
