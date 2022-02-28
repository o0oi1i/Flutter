import 'package:flutter/material.dart';

class Radios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Radios')),
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
  int sex = 1;

  void _radioChange(v) {
    setState(() {
      this.sex = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Boy:"),
              Radio(
                value: 1,
                onChanged: this._radioChange,
                groupValue: this.sex,
              ),
              SizedBox(width: 20),
              Text("Girl:"),
              Radio<int>(
                value: 0,
                onChanged: this._radioChange,
                groupValue: this.sex,
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text("${this.sex} "),
              Text(this.sex == 1 ? "Boy" : "Girl")
            ],
          ),
          Divider(),
          RadioListTile<int>(
            value: 1,
            groupValue: this.sex,
            selected: this.sex == 1,
            onChanged: this._radioChange,
            title: Text("Boy"),
            subtitle: Text("Boy 1..."),
            secondary: Icon(Icons.help),
          ),
          RadioListTile<int>(
            value: 0,
            groupValue: this.sex,
            selected: this.sex == 0,
            onChanged: this._radioChange,
            title: Text("Gril"),
            subtitle: Text("Gril 0..."),
            secondary:
                Image.network('https://www.itying.com/images/flutter/1.png'),
          ),
        ],
      ),
    );
  }
}
