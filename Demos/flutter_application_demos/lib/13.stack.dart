import 'package:flutter/material.dart';

class Stacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stacks'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 350,
        width: 250,
        color: Colors.blue,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Icon(
                Icons.home,
                size: 40,
                color: Colors.black,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 60,
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 30,
              right: 60,
              child: Icon(
                Icons.settings_applications,
                size: 30,
                color: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment(1, -0.5),
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.search,
                size: 50,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Icon(
                Icons.settings_applications,
                size: 10,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
