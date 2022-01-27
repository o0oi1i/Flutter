import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Skeleton'),
        ),
        body: Body(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Flutter Skeleton',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 23.0,
          color: Colors.deepPurple.shade300,
        ),
      ),
    );
  }
}
