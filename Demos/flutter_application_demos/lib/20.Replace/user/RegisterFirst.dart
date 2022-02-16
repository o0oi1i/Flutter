import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterFirstPage extends StatelessWidget {
  const RegisterFirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register 1")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Next 1',
                style: TextStyle(color: Colors.lightBlue),
              ),
              onPressed: () {
                // Navigator.pushNamed(context, '/registerSecond');
                Navigator.of(context).pushReplacementNamed('/registerSecond');
              },
            )
          ],
        ),
      ),
    );
  }
}
