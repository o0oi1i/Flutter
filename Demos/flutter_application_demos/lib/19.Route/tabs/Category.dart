import 'package:flutter/material.dart';

import '../navs/Form.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Category",
            style: TextStyle(color: Colors.lightBlue),
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text("Push to Form"),
            textTheme: ButtonTextTheme.primary,
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.pushNamed(context, '/form');
            },
          )
        ],
      ),
    );
  }
}
