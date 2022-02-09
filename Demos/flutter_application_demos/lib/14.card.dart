import 'package:flutter/material.dart';
import '6.List/data/listData.dart';

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listData.map((value) {
        return Card(
          margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20 / 9,
                child: Image.network(
                  value["imageUrl"],
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    value["imageUrl"],
                  ),
                ),
                title: Text(value["title"]),
                subtitle: Text(
                  value["description"],
                  maxLines: 6,
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
