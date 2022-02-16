import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  final Map arguments;

  ProductInfoPage({Key key, this.arguments}) : super(key: key);

  _ProductInfoPageState createState() =>
      _ProductInfoPageState(arguments: this.arguments);
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  Map arguments;

  _ProductInfoPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Info'),
      ),
      body: Center(
        child: Container(
          child: Text(
            "${arguments["pid"]}",
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
