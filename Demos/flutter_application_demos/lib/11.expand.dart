import 'package:flutter/material.dart';

class Expand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expands'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: IconContainer(Icons.search, color: Colors.blue),
        ),
        Expanded(
          flex: 3,
          child: IconContainer(Icons.home, color: Colors.orange),
        ),
        Expanded(
          flex: 5,
          child: IconContainer(Icons.select_all, color: Colors.red),
        ),
      ],
    );
  }
}

class IconContainer extends StatelessWidget {
  final IconData icon;
  final Color color;

  IconContainer(this.icon, {this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: this.color,
      child: Center(
        child: Icon(
          this.icon,
          size: 32.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
