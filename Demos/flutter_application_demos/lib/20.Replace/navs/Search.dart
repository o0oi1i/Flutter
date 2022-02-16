import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final arguments;

  SearchPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Center(
        child: Text(
          "Search Content ${arguments != null ? arguments['id'] : '0'}",
          style: TextStyle(color: Colors.lightBlue),
        ),
      ),
    );
  }
}
