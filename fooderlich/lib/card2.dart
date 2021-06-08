import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      // 1
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag5.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        // 2
        child: Column(
          children: [
            // TODO 1: add author information
            // TODO 4: add Positioned text
        ],
        ),
      ),
    );
  }
}
