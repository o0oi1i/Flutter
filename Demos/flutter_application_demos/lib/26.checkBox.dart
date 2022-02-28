import 'package:flutter/material.dart';

class CheckBoxs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter CheckBoxs')),
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
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: this.flag,
                onChanged: (v) {
                  setState(() {
                    if (v != null) {
                      this.flag = v;
                    }
                  });
                },
                activeColor: Colors.blue,
              ),
              Text(this.flag ? "Selected" : "unselected")
            ],
          ),
          Divider(),
          CheckboxListTile(
            value: this.flag,
            title: Text("Title"),
            subtitle: Text("Subtitle"),
            secondary: Icon(Icons.help),
            onChanged: (v) {
              setState(() {
                if (v != null) {
                  this.flag = v;
                }
              });
            },
          )
        ],
      ),
    );
  }
}
