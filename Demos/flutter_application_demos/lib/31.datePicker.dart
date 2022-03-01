import 'package:flutter/material.dart';

import 'package:date_format/date_format.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatePickers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter DatePicker')),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime _nowDate = DateTime.now();
  DateTime _nowDate1 = DateTime.now();
  DateTime _timePickerData1 = DateTime.now();
  var _nowTime = TimeOfDay(hour: 12, minute: 20);

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();

    print(now); //2019-06-08 12:08:10.140421
    print(now.millisecondsSinceEpoch); //1559967090998
    print(formatDate(now, [yyyy, '年', mm, '月', dd, '日'])); //2019年06月08

    print(DateTime.fromMillisecondsSinceEpoch(
        1646113490073)); //2019-06-08 12:11:30.998
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "${formatDate(_nowDate, [yyyy, '年', mm, '月', dd, '日'])}"),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showDatePicker,
            ),
            SizedBox(width: 20),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${_nowTime.format(context)}"),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showTimePicker,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${formatDate(_nowDate1, [yyyy, '/', mm, '/', dd])}"),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showDatePicker1,
            ),
            SizedBox(width: 20),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${formatDate(_timePickerData1, [
                    yyyy,
                    '-',
                    mm,
                    '-',
                    dd,
                    " ",
                    HH,
                    ':',
                    nn,
                    ':',
                    ss
                  ])}"),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onTap: _showDateTimePicker1,
            )
          ],
        )
      ],
    );
  }

  _showDatePicker() async {
    var result = await showDatePicker(
      context: context,
      initialDate: _nowDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
    );

    setState(() {
      if (result != null) {
        this._nowDate = result;
      }
    });
  }

  _showTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: _nowTime);
    setState(() {
      if (result != null) {
        this._nowTime = result;
      }
    });
  }

  void _showDatePicker1() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1988, 3, 5),
        maxTime: DateTime(2023, 6, 7), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      print('confirm $date');
      setState(() {
        this._nowDate1 = date;
      });
    }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }

  void _showDateTimePicker1() {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: DateTime(2020, 5, 5, 20, 50),
        maxTime: DateTime(2025, 6, 7, 05, 09), onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');
      setState(() {
        this._timePickerData1 = date;
      });
    }, locale: LocaleType.zh);
  }
}
