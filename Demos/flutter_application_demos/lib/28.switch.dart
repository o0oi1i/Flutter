import 'package:flutter/material.dart';

class Switchs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Switchs')),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Switch(
            value: this.flag,
            onChanged: (v) {
              setState(() {
                print(v);
                this.flag = v;
              });
            },
          )
        ],
      ),
    );
  }
}
