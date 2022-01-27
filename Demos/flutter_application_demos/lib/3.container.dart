import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 30, 5, 0),
        padding: EdgeInsets.fromLTRB(10, 30, 5, 0),
        height: 200.0,
        width: 200.0,
        decoration: BoxDecoration(
          color: Colors.purpleAccent.shade100,
          border: Border.all(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        transform: Matrix4.rotationZ(0.15),
      ),
    );
  }
}
