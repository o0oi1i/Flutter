import 'package:flutter/material.dart';

import 'data/listData.dart';

class Lists4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: Lists(),
      ),
    );
  }
}

class Lists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._getData(),
    );
  }

  List<Widget> _getData() {
    var tempList = listData.map((value) {
      return ListTile(
        leading: Image.network(value["imageUrl"]),
        title: Text(value["title"]),
        subtitle: Text(value["author"]),
      );
    });
    return tempList.toList();
  }
}
