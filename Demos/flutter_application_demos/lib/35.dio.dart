import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class Dios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Dio')),
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
        ? ListView(
            children: this._list.map((value) {
              return ListTile(
                title: Text(value["title"]),
              );
            }).toList(),
          )
        : Text("Empty");
  }

  _getData() async {
    var response = await Dio().get('https://jd.itying.com/api/pcate');
    print(response.data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        this._list = response.data["result"];
      });
    } else {
      print(response.statusCode);
    }
  }
}
