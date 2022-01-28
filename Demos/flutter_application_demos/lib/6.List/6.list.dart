import 'package:flutter/material.dart';

class Lists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: Container(
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 180.0,
                color: Colors.yellowAccent,
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Text',
                      textDirection: TextDirection.ltr,
                    ),
                    Image.network(
                      "https://www.itying.com/images/flutter/1.png",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Container(
                width: 180.0,
                color: Colors.greenAccent,
              ),
              Container(
                width: 180.0,
                color: Colors.blueAccent,
              ),
              Container(
                width: 180.0,
                color: Colors.deepOrangeAccent,
              ),
              Container(
                width: 180.0,
                color: Colors.deepPurpleAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
