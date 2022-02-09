import 'package:flutter/material.dart';

class Columns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Columns'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 180,
                color: Colors.deepPurple,
                child: Center(
                  child: Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                height: 180,
                child: Image.network(
                  "https://www.itying.com/images/flutter/2.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Container(
                height: 180,
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 85,
                      child: Image.network(
                        "https://www.itying.com/images/flutter/3.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 85,
                      child: Image.network(
                        "https://www.itying.com/images/flutter/4.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
