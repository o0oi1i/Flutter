import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../components/load/loading.dart';
import '../services/ScreenAdaper.dart';
import '../config/Config.dart';
import '../model/lesson.dart';

class Lessons extends StatefulWidget {
  Map arguments;

  Lessons({Key key, arguments}) : super(key: key);

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
    _getLessonsListData();
    //监听滚动条滚动事件
    _scrollController.addListener(() {
      //_scrollController.position.pixels //获取滚动条滚动的高度
      //_scrollController.position.maxScrollExtent  //获取页面高度
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
        title: Text("课程列表"),
        leading: IconButton(
            onPressed: () {
              //注意：新版本的Flutter中加入Drawer组件会导致默认的返回按钮失效，所以我们需要手动加一下返回按钮
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        actions: <Widget>[Text("")],
      ),
      endDrawer: Drawer(
        child: Container(
          child: Text("实现筛选功能"),
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
        margin: EdgeInsets.only(top: ScreenAdaper.height(80)),
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
                      width: ScreenAdaper.width(180),
                      height: ScreenAdaper.height(180),
                      child: Image.network("${pic}", fit: BoxFit.cover),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: ScreenAdaper.height(180),
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${_lessonsList[index].title}",
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: ScreenAdaper.height(36),
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromRGBO(230, 230, 230, 0.9),
                                  ),
                                  child: Text("4g"),
                                ),
                                Container(
                                  height: ScreenAdaper.height(36),
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromRGBO(230, 230, 230, 0.9),
                                  ),
                                  child: Text("126"),
                                ),
                              ],
                            ),
                            Text(
                              "¥${_lessonsList[index].price}",
                              style: TextStyle(color: Colors.red, fontSize: 16),
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
      height: ScreenAdaper.height(80),
      width: ScreenAdaper.width(750),
      child: Container(
        width: ScreenAdaper.width(750),
        height: ScreenAdaper.height(80),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromRGBO(233, 233, 233, 0.9)))),
        child: Row(
          children: _subHeaderList.map((value) {
            return Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdaper.height(16), 0, ScreenAdaper.height(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${value["title"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: (_selectHeaderId == value["id"])
                                ? Colors.red
                                : Colors.black54),
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

    var api =
        '${Config.domain}api/plist?cid=${widget.arguments["cid"]}&page=${_page}&sort=${_sort}&pageSize=${_pageSize}';
    var result = await Dio().get(api);
    var lessonsList = new Lesson.fromJson(result.data);
    if (lessonsList.result.length < _pageSize) {
      setState(() {
        _flag = true;
        _hasMore = false;
        _lessonsList.addAll(lessonsList.result);
      });
    } else {
      setState(() {
        _page++;
        _flag = true;
        _lessonsList.addAll(lessonsList.result);
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
        return Icon(Icons.arrow_drop_down);
      }
      return Icon(Icons.arrow_drop_up);
    }
    return Text("");
  }

  Widget _more(index) {
    if (_hasMore) {
      return (index == _lessonsList.length - 1) ? Loading() : Text("");
    } else {
      return (index == _lessonsList.length - 1) ? Text("--我是有底线的--") : Text("");
      ;
    }
  }
}
