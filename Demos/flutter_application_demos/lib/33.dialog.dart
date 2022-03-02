import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dialogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Dialog')),
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: Text('AlertDialog'),
            onPressed: _alertDialog,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('SimpleDialog'),
            onPressed: _simpleDialog,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('ActionSheet'),
            onPressed: _modelBottomSheet,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('FlutterToast'),
            onPressed: _toast,
          ),
        ],
      ),
    );
  }

  _alertDialog() async {
    var result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Title"),
          content: Text("Content"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                print("Cancel");
                Navigator.pop(context, 'Cancel.');
              },
            ),
            TextButton(
              child: Text("Confirm"),
              onPressed: () {
                print("Confirm");
                Navigator.pop(context, "Confirm.");
              },
            )
          ],
        );
      },
    );
    print(result);
  }

  _simpleDialog() async {
    var result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Title"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Option A"),
              onPressed: () {
                print("Option A");
                Navigator.pop(context, "Option A.");
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text("Option B"),
              onPressed: () {
                print("Option B");
                Navigator.pop(context, "Option B.");
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text("Option C"),
              onPressed: () {
                print("Option C");
                Navigator.pop(context, "Option C.");
              },
            ),
            Divider(),
          ],
        );
      },
    );
    print(result);
  }

  _modelBottomSheet() async {
    var result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Share A"),
                onTap: () {
                  Navigator.pop(context, "Share A.");
                },
              ),
              Divider(),
              ListTile(
                title: Text("Share B"),
                onTap: () {
                  Navigator.pop(context, "Share B.");
                },
              ),
              Divider(),
              ListTile(
                title: Text("Share C"),
                onTap: () {
                  Navigator.pop(context, "Share C.");
                },
              ),
              Divider(),
            ],
          ),
        );
      },
    );
    print(result);
  }

  _toast() {
    Fluttertoast.showToast(
      msg: "Msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
