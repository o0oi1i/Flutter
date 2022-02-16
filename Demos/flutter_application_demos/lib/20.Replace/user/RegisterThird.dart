import 'package:flutter/material.dart';
import '../tabs/Tab.dart';

class RegisterThirdPage extends StatelessWidget {
  const RegisterThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register 3")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Done',
                style: TextStyle(color: Colors.lightBlue),
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(
                    builder: (context) => new Tabs(index: 1),
                  ),
                  (route) => route == null,
                );
                // Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
