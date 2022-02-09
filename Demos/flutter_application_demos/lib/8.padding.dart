import 'package:flutter/material.dart';

class Paddings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Padding'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 60, 30, 20),
        child: Image.network(
          'https://www.itying.com/images/flutter/1.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
