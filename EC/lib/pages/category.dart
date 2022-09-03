import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../model/cate.dart';
import '../config/config.dart';
import '../services/ScreenAdaper.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with AutomaticKeepAliveClientMixin {
  int _selectIndex = 0;
  List _leftCateList = [];
  List _rightCateList = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getLeftCateData();
  }

  _getLeftCateData() async {
    var api = '${Config.domain}api/pcate';
    var result = await Dio().get(api);
    var leftCateList = new Cate.fromJson(result.data);
    setState(() {
      _leftCateList = leftCateList.result;
    });
    _getRightCateData(leftCateList.result[0].cId);
  }

  _getRightCateData(pid) async {
    var api = '${Config.domain}api/pcate?pid=$pid';
    var result = await Dio().get(api);
    var rightCateList = new Cate.fromJson(result.data);
    setState(() {
      _rightCateList = rightCateList.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var leftWidth = ScreenAdaper.getScreenWidth() / 4;

    var rightItemWidth = ScreenAdaper.width(
        (ScreenAdaper.getScreenWidth() - leftWidth - 20 - 20) / 3);
    var rightItemHeight = rightItemWidth + ScreenAdaper.height(28);

    return Row(
      children: <Widget>[
        _leftCateWidget(leftWidth),
        _rightCateWidget(rightItemWidth, rightItemHeight)
      ],
    );
  }

  Widget _leftCateWidget(leftWidth) {
    if (_leftCateList.length > 0) {
      return Container(
        width: leftWidth,
        height: double.infinity,
        child: ListView.builder(
          itemCount: _leftCateList.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectIndex = index;
                      _getRightCateData(_leftCateList[index].cId);
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: ScreenAdaper.height(84),
                    padding: EdgeInsets.only(top: ScreenAdaper.height(24)),
                    child: Text(
                      "${_leftCateList[index].title}",
                      textAlign: TextAlign.center,
                    ),
                    color: _selectIndex == index
                        ? Color.fromARGB(65, 98, 98, 98)
                        : Colors.grey[900],
                  ),
                ),
                Divider(height: 1),
              ],
            );
          },
        ),
      );
    } else {
      return Container(
        width: leftWidth,
        height: double.infinity,
      );
    }
  }

  Widget _rightCateWidget(rightItemWidth, rightItemHeight) {
    if (_rightCateList.length > 0) {
      return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          color: Color.fromARGB(228, 75, 75, 75),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: rightItemWidth / rightItemHeight,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _rightCateList.length,
            itemBuilder: (context, index) {
              String pic = _rightCateList[index].pic;
              pic = Config.domain + pic.replaceAll('\\', '/');
              return Container(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network("$pic", fit: BoxFit.cover),
                    ),
                    Container(
                      height: ScreenAdaper.height(28),
                      child: Text("${_rightCateList[index].title}"),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          color: Color.fromARGB(228, 75, 75, 75),
          child: Text("加载中..."),
        ),
      );
    }
  }
}
