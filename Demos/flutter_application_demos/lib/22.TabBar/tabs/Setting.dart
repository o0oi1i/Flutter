import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Setting",
            style: TextStyle(color: Colors.lightBlue),
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text("Push to Tab Bar"),
            textTheme: ButtonTextTheme.primary,
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/tabBar',
              );
            },
          ),
        ],
      ),
    );
  }
}
