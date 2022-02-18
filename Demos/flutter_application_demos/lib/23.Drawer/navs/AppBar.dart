import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('Menu');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search');
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print('Settings');
              },
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Hot"),
              Tab(text: "Recommend"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                    title: Text(
                  "Hot 1",
                  style: TextStyle(
                    color: Colors.lightBlue,
                  ),
                )),
                ListTile(
                    title: Text(
                  "Hot 2",
                  style: TextStyle(
                    color: Colors.lightBlue,
                  ),
                )),
                ListTile(
                    title: Text(
                  "Hot 3",
                  style: TextStyle(
                    color: Colors.lightBlue,
                  ),
                )),
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Recommend 1",
                    style: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Recommend 2",
                    style: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Recommend 3",
                    style: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
