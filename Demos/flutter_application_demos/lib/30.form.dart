import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Form')),
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
  String username;
  String info = '';

  List hobby = [
    {
      "checked": true,
      "title": "Eat",
    },
    {
      "checked": false,
      "title": "Sleep",
    },
    {
      "checked": true,
      "title": "Code",
    }
  ];

  List<Widget> _getHobby() {
    List<Widget> tempList = [];
    for (var i = 0; i < this.hobby.length; i++) {
      tempList.add(
        Row(
          children: <Widget>[
            Text(this.hobby[i]["title"] + ":"),
            Checkbox(
              value: this.hobby[i]["checked"],
              onChanged: (value) {
                setState(() {
                  this.hobby[i]["checked"] = value;
                });
              },
            )
          ],
        ),
      );
    }
    return tempList;
  }

  void _sexChanged(value) {
    setState(() {
      this.sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: "Please input user name"),
            onChanged: (value) {
              setState(() {
                this.username = value;
              });
            },
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text("Boy"),
              Radio(
                value: 1,
                onChanged: this._sexChanged,
                groupValue: this.sex,
              ),
              SizedBox(width: 20),
              Text("Gril"),
              Radio(
                value: 2,
                onChanged: this._sexChanged,
                groupValue: this.sex,
              )
            ],
          ),
          SizedBox(height: 40),
          Column(
            children: this._getHobby(),
          ),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Information",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                this.info = value;
              });
            },
          ),
          SizedBox(height: 40),
          Container(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              child: Text("Submit"),
              onPressed: () {
                print(this.sex);
                print(this.username);
                print(this.hobby);
              },
            ),
          )
        ],
      ),
    );
  }
}
