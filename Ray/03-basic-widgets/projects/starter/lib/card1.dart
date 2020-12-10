import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  // 1
  final String category = "Editor's Choice";
  final String title = "The Art of Dough";
  final String description = "Learn to make the perfect bread.";
  final String chef = "Ray Wenderlich";

  // 2
  @override
  Widget build(BuildContext context) {
    // 3
    return Center(
      child: Container(
        // 1
        padding: EdgeInsets.all(16),
        // 2
        constraints: BoxConstraints.expand(width: 340, height: 480),
        // 3
        decoration: BoxDecoration(
          // 4
          image: DecorationImage(
            // 5
            image: AssetImage("assets/mag1.png"),
            // 6
            fit: BoxFit.cover,
          ),
          // 7
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Stack(
          children: [
            // 8
            Text(
              category,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
            // 9
            Positioned(
              child: Text(
                title,
                style: FooderlichTheme.darkTextTheme.headline2,
              ),
              top: 20,
            ),
            // 10
            Positioned(
              child: Text(
                description,
                style: FooderlichTheme.darkTextTheme.bodyText1,
              ),
              bottom: 30,
              right: 0,
            ),
            // 11
            Positioned(
              child: Text(
                chef,
                style: FooderlichTheme.darkTextTheme.bodyText1,
              ),
              bottom: 10,
              right: 0,
            )
          ],
        ),
      ),
    );
  }
}
