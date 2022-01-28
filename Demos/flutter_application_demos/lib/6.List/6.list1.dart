import 'package:flutter/material.dart';

class Lists1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: Container(
          // height: 280,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              ListTile(
                leading: Image.network(
                    "https://www.itying.com/images/201906/goods_img/1120_P_1560842352183.png"),
                title: Text('华北黄淮高温雨今起强势登场'),
                subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
              ),
              ListTile(
                leading: Image.network(
                    "https://www.itying.com/themes/itying/images/ionic4.png"),
                title: Text('保监局50天开32罚单 “断供”违规资金为房市降温'),
                subtitle: Text("中国天气网讯 保监局50天开32罚单 “断供”违规资金为房市降温"),
              ),
              ListTile(
                  title: Text('华北黄淮高温雨今起强势登场'),
                  subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
                  trailing: Image.network(
                      "https://www.itying.com/themes/itying/images/ionic4.png")),
              ListTile(
                title: Text('华北黄淮高温雨今起强势登场'),
                subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
                trailing: Icon(Icons.home),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('华北黄淮高温雨今起强势登场'),
                subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.deepPurpleAccent,
                ),
                title: Text('华北黄淮高温雨今起强势登场'),
                subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
