import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../components/load/loading.dart';
import '../services/ScreenAdapter.dart';
import '../config/Config.dart';
import '../model/lesson.dart';

// ignore: must_be_immutable
class Lessons extends StatefulWidget {
  Map arguments;

  Lessons({Key key, this.arguments}) : super(key: key);

  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ScrollController _scrollController = ScrollController();

  String _sort = "";

  bool _flag = true;
  bool _hasMore = true;

  int _page = 1;
  int _pageSize = 8;
  int _selectHeaderId = 1;

  var _initKeywordsController = new TextEditingController();
  var _pid;
  var _keywords;

  List _lessonsList = [];
  List _subHeaderList = [
    {"id": 1, "title": "综合", "fields": "all", "sort": -1},
    {"id": 2, "title": "销量", "fields": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fields": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];

  @override
  void initState() {
    super.initState();
    this._pid = widget.arguments["pid"];
    this._keywords = widget.arguments["keywords"];
    if (this._keywords != null) {
      this._initKeywordsController.text = this._keywords; //类型断言
    }

    _getLessonsListData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        if (_flag && _hasMore) {
          _getLessonsListData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          child: TextField(
            controller: this._initKeywordsController,
            autofocus: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                this._keywords = value;
              });
            },
          ),
          height: ScreenAdapter.height(68),
          decoration: BoxDecoration(
              color: Color.fromRGBO(233, 233, 233, 0.8),
              borderRadius: BorderRadius.circular(30)),
        ),
        actions: <Widget>[
          InkWell(
            child: Container(
              height: ScreenAdapter.height(68),
              width: ScreenAdapter.width(80),
              child: Row(
                children: <Widget>[Text("搜索")],
              ),
            ),
            onTap: () {
              this._subHeaderChange(1);
            },
          )
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          child: Text("筛选"),
        ),
      ),
      body: Stack(
        children: <Widget>[
          _productList(),
          _subHeaderWidget(),
        ],
      ),
    );
  }

  Widget _productList() {
    if (_lessonsList.length > 0) {
      return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            String pic = _lessonsList[index].pic;
            pic = Config.domain + pic.replaceAll('\\', '/');
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: ScreenAdapter.width(180),
                      height: ScreenAdapter.height(180),
                      child: Image.network("$pic", fit: BoxFit.cover),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: ScreenAdapter.height(180),
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${_lessonsList[index].title}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: ScreenAdapter.height(36),
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.lightBlue[300],
                                  ),
                                  child: Text("4g"),
                                ),
                                Container(
                                  height: ScreenAdapter.height(36),
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.lightGreen[500],
                                  ),
                                  child: Text("126"),
                                ),
                              ],
                            ),
                            Text(
                              "¥${_lessonsList[index].price}",
                              style: TextStyle(
                                  color: Colors.pink[200], fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Divider(height: 20),
                _more(index)
              ],
            );
          },
          itemCount: _lessonsList.length,
        ),
      );
    } else {
      return Loading();
    }
  }

  Widget _subHeaderWidget() {
    return Positioned(
      top: 0,
      height: ScreenAdapter.height(80),
      width: ScreenAdapter.width(750),
      child: Container(
        width: ScreenAdapter.width(750),
        height: ScreenAdapter.height(80),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.blueGrey,
            ),
          ),
        ),
        child: Row(
          children: _subHeaderList.map((value) {
            return Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    ScreenAdapter.height(16),
                    0,
                    ScreenAdapter.height(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${value["title"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: (_selectHeaderId == value["id"])
                                ? Colors.purpleAccent
                                : Colors.white),
                      ),
                      _showIcon(value["id"])
                    ],
                  ),
                ),
                onTap: () {
                  _subHeaderChange(value["id"]);
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  _getLessonsListData() async {
    setState(() {
      _flag = false;
    });

    print(widget.arguments);
    var api;
    if (this._keywords == null) {
      api =
          '${Config.domain}api/plist?cid=${this._pid}&page=${this._page}&sort=${this._sort}&pageSize=${this._pageSize}';
    } else {
      api =
          '${Config.domain}api/plist?search=${this._keywords}&page=${this._page}&sort=${this._sort}&pageSize=${this._pageSize}';
    }
    print(api);

    var result = await Dio().get(api);
    var lessonsList = new Lesson.fromJson(result.data);
    if (lessonsList.result.length < _pageSize) {
      setState(() {
        _lessonsList.addAll(lessonsList.result);
        _hasMore = false;
        _flag = true;
      });
    } else {
      setState(() {
        _lessonsList.addAll(lessonsList.result);
        _flag = true;
        _page++;
      });
    }
  }

  _subHeaderChange(id) {
    if (id == 4) {
      _scaffoldKey.currentState.openEndDrawer();
      setState(() {
        _selectHeaderId = id;
      });
    } else {
      setState(() {
        _sort =
            "${_subHeaderList[id - 1]["fields"]}_${_subHeaderList[id - 1]["sort"]}";
        _page = 1;
        _hasMore = true;
        _lessonsList = [];
        _selectHeaderId = id;
        _scrollController.jumpTo(0);
        _subHeaderList[id - 1]['sort'] = _subHeaderList[id - 1]['sort'] * -1;

        _getLessonsListData();
      });
    }
  }

  Widget _showIcon(id) {
    if (id == 2 || id == 3) {
      if (_subHeaderList[id - 1]["sort"] == 1) {
        return Icon(
          Icons.arrow_drop_down,
          color: Colors.purple[100],
        );
      }
      return Icon(
        Icons.arrow_drop_up,
        color: Colors.blue[100],
      );
    }
    return Text("");
  }

  Widget _more(index) {
    if (_hasMore) {
      return (index == _lessonsList.length - 1) ? Loading() : Text("");
    } else {
      return (index == _lessonsList.length - 1) ? Text("--我是有底线的--") : Text("");
    }
  }
}
