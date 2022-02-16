import 'package:flutter/material.dart';

class RegisterSecondPage extends StatelessWidget {
  const RegisterSecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register 2")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Next 2',
                style: TextStyle(color: Colors.lightBlue),
              ),
              onPressed: () {
                // Navigator.pushNamed(context, '/registerThird');
                Navigator.of(context).pushReplacementNamed('/registerThird');
              },
            )
          ],
        ),
      ),
    );
  }
}
