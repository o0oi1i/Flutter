import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          RaisedButton(
            child: Text('Push to News'),
            onPressed: () {
              Navigator.pushNamed(context, '/news');
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
