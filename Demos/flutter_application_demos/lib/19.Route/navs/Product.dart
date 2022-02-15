import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "Push to Product Info",
                style: TextStyle(color: Colors.lightBlue),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/productinfo',
                  arguments: {"pid": "冰墩墩"},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
