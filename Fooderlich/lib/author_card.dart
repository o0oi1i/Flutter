import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
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

  @override
  _AuthorCardState createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    // TODO: Replace return Container(...);
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Row(
        // TODO 3: add alignment
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 1
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              // 2
              const SizedBox(width: 10),
              // 3
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  )
                ],
              ),
            ],
          ),
          // TODO 2: add IconButton
          IconButton(
            // 1
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            // 2
            color: _isFavorited ? Colors.red[400] : Colors.grey,
            onPressed: () {
              // 3
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
          )
        ],
      ),
    );
  }
}
