import 'package:flutter/material.dart';

import '../../themes/ec_theme.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider imageProvider;

  const AuthorCard({Key key, this.authorName, this.title, this.imageProvider})
      : super(key: key);

  @override
  _AuthorCardState createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 28,
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: widget.imageProvider,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: ECTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: ECTheme.lightTextTheme.headline3,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
