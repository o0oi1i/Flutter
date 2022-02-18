import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Buttons"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 50,
                    // width: 250,
                    margin: EdgeInsets.all(20),
                    child: RaisedButton.icon(
                      icon: Icon(Icons.search),
                      label: Text('Raised Button'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // shape:
                      //     CircleBorder(side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        print("Raised Button");
                      },
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
              child: Text("Text Button"),
              onPressed: () {
                print('Text Button');
              },
            ),
            FlatButton(
              child: Text("Flat Button"),
              color: Colors.blue,
              textColor: Colors.lightBlueAccent,
              onPressed: () {
                print('Flat Button');
              },
            ),
            OutlineButton(
              child: Text("Outline Button"),
              color: Colors.red, //没有效果
              textColor: Colors.lightBlueAccent,
              onPressed: () {
                print('Outline Button');
              },
            ),
            Container(
              height: 60,
              width: 180,
              child: ElevatedButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Elevated Button'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(10),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                  ),
                ),
                onPressed: () {
                  print("Elevated Button");
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Login'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      onPressed: () {
                        print("Login");
                      },
                    ),
                    RaisedButton(
                      child: Text('Register'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      onPressed: () {
                        print("Register");
                      },
                    ),
                  ],
                )
              ],
            ),
            CustomButton(
              text: "Custom Button",
              height: 45.0,
              width: 180.0,
              pressed: () {
                print('Custom Button');
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final text;
  final pressed;
  final width;
  final height;
  const CustomButton({
    this.text = '',
    this.pressed,
    this.width = 80,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        child: Text(
          this.text,
          style: TextStyle(color: Colors.lightBlue),
        ),
        onPressed: this.pressed,
      ),
    );
  }
}
