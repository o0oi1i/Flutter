import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Text',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.ltr,
        maxLines: 2,
        textScaleFactor: 1.8,
        style: TextStyle(
          fontSize: 36.0,
          color: Colors.deepPurple.shade300,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.lineThrough,
          decorationColor: Colors.greenAccent.shade100,
          decorationStyle: TextDecorationStyle.dotted,
          letterSpacing: 10.0,
        ),
      ),
    );
  }
}
