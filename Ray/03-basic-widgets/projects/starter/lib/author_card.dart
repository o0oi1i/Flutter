import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatelessWidget {
  // 1
  final String authorName;
  final String title;
  final ImageProvider imageProvider;

  const AuthorCard({
    Key key,
    this.authorName,
    this.title,
    this.imageProvider,
  }) : super(key: key);

  // 2
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 1
          Row(children: [
            CircleImage(imageProvider, imageRadius: 28),
            // 2
            SizedBox(width: 8),
            // 3
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authorName,
                  style: FooderlichTheme.lightTextTheme.headline2,
                ),
                Text(
                  title,
                  style: FooderlichTheme.lightTextTheme.headline3,
                )
              ],
            ),
          ]),
          IconButton(
            // 4
            icon: Icon(Icons.favorite_border),
            iconSize: 30,
            color: Colors.grey[400],
            // 5
            onPressed: () {
              final snackBar = SnackBar(content: Text('Press Favorite'));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }
}
