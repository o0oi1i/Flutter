import 'package:flutter/material.dart';

class Lists2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: Container(
          // height: 280,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              Image.network("https://www.itying.com/images/flutter/1.png"),
              Container(
                child: Text(
                  '我是一个标题',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                height: 60,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              Image.network("https://www.itying.com/images/flutter/2.png"),
              Container(
                child: Text(
                  '我是一个标题',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                height: 60,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              Image.network("https://www.itying.com/images/flutter/4.png"),
              Container(
                child: Text(
                  '我是一个标题',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                height: 60,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              Image.network("https://www.itying.com/images/flutter/1.png"),
              Container(
                child: Text(
                  '我是一个标题',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                height: 60,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              Image.network("https://www.itying.com/images/flutter/2.png"),
              Image.network("https://www.itying.com/images/flutter/2.png"),
            ],
          ),
        ),
      ),
    );
  }
}
