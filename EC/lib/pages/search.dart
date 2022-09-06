import 'package:flutter/material.dart';

import '../services/ScreenAdapter.dart';
import '../services/SearchServices.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _keywords;
  List _historyData = [];

  @override
  void initState() {
    super.initState();
    _getHistoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              this._keywords = value;
            },
          ),
          height: ScreenAdapter.height(68),
          decoration: BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 0.8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        actions: <Widget>[
          InkWell(
            child: Container(
              height: ScreenAdapter.height(68),
              width: ScreenAdapter.width(100),
              child: Row(
                children: <Widget>[
                  Text("搜索"),
                ],
              ),
            ),
            onTap: () {
              SearchServices.setHistoryData(this._keywords);
              Navigator.pushReplacementNamed(context, '/lessons', arguments: {
                "keywords": this._keywords,
              });
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              child: Text(
                "热搜",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Divider(),
            Wrap(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 133, 133, 0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("女装"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 133, 133, 0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("男装"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 133, 133, 0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("笔记本电脑"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 133, 133, 0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("手机"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 133, 133, 0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("男鞋"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 133, 133, 0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("女鞋"),
                ),
              ],
            ),
            SizedBox(height: 20),
            _historyListWidget()
          ],
        ),
      ),
    );
  }

  Widget _historyListWidget() {
    if (_historyData.length > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text("历史记录", style: Theme.of(context).textTheme.subtitle1),
          ),
          Divider(),
          Column(
            children: this._historyData.map((value) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text("${value}"),
                    onLongPress: () {
                      this._showAlertDialog("${value}");
                    },
                  ),
                  Divider()
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  SearchServices.clearHistoryList();
                  this._getHistoryData();
                },
                child: Container(
                  width: ScreenAdapter.width(400),
                  height: ScreenAdapter.height(64),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.delete),
                      Text(" 清空历史"),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      );
    } else {
      return Text("");
    }
  }

  _showAlertDialog(keywords) async {
    var result = await showDialog(
      barrierDismissible: false, //表示点击灰色背景的时候是否消失弹出框
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示信息!"),
          content: Text("您确定要删除吗?"),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () {
                Navigator.pop(context, 'Cancle');
              },
            ),
            TextButton(
              child: Text("确定"),
              onPressed: () async {
                await SearchServices.removeHistoryData(keywords);
                this._getHistoryData();
                Navigator.pop(context, "Ok");
              },
            )
          ],
        );
      },
    );
    print(result);
  }

  _getHistoryData() async {
    var historyListData = await SearchServices.getHistoryList();
    setState(() {
      _historyData = historyListData;
    });
  }
}
