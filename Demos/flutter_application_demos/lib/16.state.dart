import 'package:flutter/material.dart';

class Stateful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Stateful')),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Chip(
            backgroundColor: Colors.lightBlue,
            label: Text(
              '${this.count}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FlatButton(
            child: Text(
              '增加',
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
            onPressed: () {
              setState(() {
                this.count++;
              });
            },
          ),
        ],
      ),
    );
  }
}
