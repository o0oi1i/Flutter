import 'package:flutter/material.dart';

import 'data/listData.dart';

class Lists3 extends StatelessWidget {
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
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: this._getListData,
    );
  }

  Widget _getListData(context, index) {
    return ListTile(
      leading: Image.network(listData[index]["imageUrl"]),
      title: Text(listData[index]["title"]),
      subtitle: Text(listData[index]["author"]),
    );
  }
}
