import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello Flutter',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 36.0,
          color: Colors.deepPurple.shade200,
        ),
      ),
    );
  }
}
