import 'package:flutter/material.dart';
import '../models/models.dart';
import 'components.dart';

class FriendPostListView extends StatelessWidget {
  // 1
  final List<Post> friendPosts;

  const FriendPostListView({Key key, this.friendPosts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2
    return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 0),
        // 3
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // 4
          Text("Social Chefs 👩‍🍳",
              style: Theme.of(context).textTheme.headline1),
          // 5
          SizedBox(height: 16),
          // 1
          ListView.separated(
            // 2
            primary: false,
            // 3
            physics: NeverScrollableScrollPhysics(),
            // 4
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index) {
              // 5
              var post = friendPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              // 6
              return SizedBox(height: 16);
            },
          ),
          // 6
          SizedBox(height: 16),
        ]));
  }
}
