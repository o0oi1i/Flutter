import 'package:flutter/material.dart';

class Wraps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wraps'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      // runSpacing: 10,
      // direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      // runAlignment: WrapAlignment.center,
      children: <Widget>[
        Btn("第1集"),
        Btn("第2集"),
        Btn("第3集"),
        Btn("第4集"),
        Btn("第5集"),
        Btn("第6集"),
        Btn("第7集"),
        Btn("第8集"),
        Btn("第9集"),
      ],
    );
  }
}

class Btn extends StatelessWidget {
  final String text;

  const Btn(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.text),
      onPressed: () {
        print(this.text);
      },
    );
  }
}
