import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  String title;

  FormPage({this.title = "Form"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'ListTile-1',
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
          ListTile(
            title: Text(
              'ListTile-2',
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
          ListTile(
            title: Text(
              'ListTile-3',
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Back'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
