import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class RecipesScreen extends StatelessWidget {
  // 1
  final exploreService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    // 2
    return FutureBuilder(
      // 3
      future: exploreService.getRecipes(),
      builder: (context, snapshot) {
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          return RecipesGridView(recipes: snapshot.data);
        } else {
          // 6
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
