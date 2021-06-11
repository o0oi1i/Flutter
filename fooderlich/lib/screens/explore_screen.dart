import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          // TODO: Add Nested List Views
          if (snapshot.connectionState == ConnectionState.done) {
            ExploreData data = snapshot.data;
            return TodayRecipeListView(recipes: data.todayRecipes);
          } else {
            // 6
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
