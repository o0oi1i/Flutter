import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/components/today_recipe_list_view.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();

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
              // 6
              scrollDirection: Axis.vertical,
              children: [
                // 7
                TodayRecipeListView(recipes: snapshot.data.todayRecipes),
                // 8
                SizedBox(height: 16),
                // 9
                FriendPostListView(friendPosts: snapshot.data.friendPosts),
              ],
            );
          } else {
            // 10
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
