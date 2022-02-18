import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Home",
            style: TextStyle(color: Colors.lightBlue),
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text("Push to App Bar"),
            textTheme: ButtonTextTheme.primary,
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/appBar',
              );
            },
          ),
        ],
      ),
    );
  }
}
