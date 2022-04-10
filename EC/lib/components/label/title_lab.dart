import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: ScreenUtil().setHeight(26),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.purpleAccent,
            width: ScreenUtil().setWidth(10),
          ),
        ),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil().setSp(18),
        ),
      ),
    );
  }
}
