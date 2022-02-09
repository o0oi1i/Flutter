import 'package:flutter/material.dart';

import '6.List/data/listData.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 5.0, //水平子 Widget 之间间距
      mainAxisSpacing: 5.0, //垂直子 Widget 之间间距
      padding: EdgeInsets.all(5),
      crossAxisCount: 2, //一行的 Widget 数量
      // childAspectRatio: 0.7, //宽度和高度的比例
      children: this._getListData(),
    );
  }

  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      return Container(
        child: Column(
          children: <Widget>[
            Image.network(value['imageUrl']),
            SizedBox(height: 15),
            Text(
              value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          border: Border.all(
            color: Color.fromRGBO(233, 233, 233, 0.9),
            width: 5,
          ),
        ),
      );
    });
    return tempList.toList();
  }
}
