import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TitleLab extends StatelessWidget {
  TitleLab({this.value});

  String value;

  @override
  Widget build(BuildContext context) {
    return _titleLabWidget(value);
  }

  Widget _titleLabWidget(value) {
    return Container(
      // color: Colors.blueAccent,
      height: ScreenUtil().setHeight(40),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.purpleAccent,
            width: ScreenUtil().setWidth(15),
          ),
        ),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: Color.fromARGB(255, 174, 97, 196),
          fontSize: ScreenUtil().setSp(33),
        ),
      ),
    );
  }
}
