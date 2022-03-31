import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Http extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Http')),
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
  List _list = [];

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  @override
  Widget build(BuildContext context) {
    return this._list.length > 0
        ? ListView.builder(
            itemCount: this._list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(this._list[index]["title"]),
              );
            },
          )
        : Text("Empty");
  }

  _getData() async {
    var response = await http.get(Uri.parse('https://jd.itying.com/api/pcate'));
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      setState(() {
        this._list = json.decode(response.body)["result"];
      });
    } else {
      print(response.statusCode);
    }
  }
}
