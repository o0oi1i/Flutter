import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ScrollController _controller;

  final mockService = MockFooderlichService();

  void _scrollListener() {
    // 1
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print('i am at the bottom!');
    }
    // 2
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print('i am at the top!');
    }
  }

  @override
  void initState() {
    // 1
    _controller = ScrollController();
    // 2
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 1
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
      // 3
      builder: (context, snapshot) {
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          return ListView(
              controller: _controller,
              // 6
              scrollDirection: Axis.vertical,
              children: [
                // 7
                TodayRecipeListView(recipes: snapshot.data.todayRecipes),
                // 8
                const SizedBox(height: 16),
                // 9
                FriendPostListView(friendPosts: snapshot.data.friendPosts)
              ]);
        } else {
          // 10
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
