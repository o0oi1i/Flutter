import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Swipers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Swiper')),
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
  List<Map> imgList = [
    {"url": "https://www.itying.com/images/flutter/1.png"},
    {"url": "https://www.itying.com/images/flutter/2.png"},
    {"url": "https://www.itying.com/images/flutter/3.png"},
    {"url": "https://www.itying.com/images/flutter/4.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: new Swiper(
              layout: SwiperLayout.CUSTOM,
              customLayoutOption: new CustomLayoutOption(
                startIndex: 0,
                stateCount: 3,
              ).addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
                new Offset(-370.0, -40.0),
                new Offset(0.0, 0.0),
                new Offset(370.0, -40.0)
              ]),
              itemWidth: 200.0,
              itemHeight: 200.0,
              itemBuilder: (context, index) {
                return new Container(
                  child: new Center(
                    child: Image.network(
                      imgList[index]['url'],
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
              itemCount: imgList.length,
            ),
          ),
        ),
        Row(
          children: <Widget>[Text("Text")],
        )
      ],
    );
  }
}
