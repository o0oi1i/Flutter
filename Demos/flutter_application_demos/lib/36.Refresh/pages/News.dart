import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:dio/dio.dart';

class News extends StatefulWidget {
  News({Key key}) : super(key: key);

  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  int _page = 1;
  List _list = [];
  bool hasMore = true;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    this._getData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 40) {
        this._getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: this._list.length > 0
          ? RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: this._list.length,
                itemBuilder: (context, index) {
                  if (index == this._list.length - 1) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("${this._list[index]["title"]}",
                              maxLines: 1),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/newscontent',
                              arguments: {
                                "aid": this._list[index]["aid"],
                              },
                            );
                          },
                        ),
                        Divider(),
                        _getMoreWidget()
                      ],
                    );
                  } else {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("${this._list[index]["title"]}",
                              maxLines: 1),
                          onTap: () {
                            print(this._list[index]["aid"]);
                            Navigator.pushNamed(
                              context,
                              '/newscontent',
                              arguments: {
                                "aid": this._list[index]["aid"],
                              },
                            );
                          },
                        ),
                        Divider()
                      ],
                    );
                  }
                },
              ),
            )
          : _getMoreWidget(),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      print('Refresh Finish');
      _getData();
    });
  }

  void _getData() async {
    if (this.hasMore) {
      var apiUrl =
          "https://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}";
      var response = await Dio().get(apiUrl);
      var res = json.decode(response.data)["result"];

      setState(() {
        this._list.addAll(res);
        this._page++;
      });

      if (res.length < 20) {
        setState(() {
          this.hasMore = false;
        });
      }
    }
  }

  Widget _getMoreWidget() {
    if (hasMore) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
              Text(
                'Loading...',
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text("-- Dead Line --"),
      );
    }
  }
}
