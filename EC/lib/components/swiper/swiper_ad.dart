import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'package:dio/dio.dart';

// import 'dart:convert';

import '../../config/config.dart';
import '../../model/advertise.dart';

class SwiperAd extends StatefulWidget {
  @override
  State<SwiperAd> createState() => _SwiperAdState();
}

class _SwiperAdState extends State<SwiperAd> {
  List _adList = [];

  @override
  void initState() {
    super.initState();
    _getAdListData();
  }

  @override
  Widget build(BuildContext context) {
    return _swiperWidget();
  }

  Widget _swiperWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            String pic = _adList[index].pic;
            return new Image.network(
              "${Config.domain}${pic.replaceAll('\\', '/')}",
              fit: BoxFit.fill,
            );
          },
          itemCount: _adList.length,
          pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Color.fromARGB(255, 209, 209, 209),
              activeColor: Colors.white,
              size: 8,
            ),
          ),
          autoplay: true,
        ),
      ),
    );
  }

  _getAdListData() async {
    var api = '${Config.domain}api/focus';
    var result = await Dio().get(api);
    var adList = Advertise.fromJson(result.data);

    setState(() {
      this._adList = adList.result;
    });
  }
}
