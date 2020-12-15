import 'package:flutter/material.dart';
// 1
import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  // 2
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({Key key, this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3
    return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        // 4
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // 5
          Text("Recipes of the Day 🍳",
              style: Theme.of(context).textTheme.headline1),
          // 6
          SizedBox(height: 16),
          // 7
          Container(
            height: 300,
            // 1
            color: Colors.transparent,
// 2
            child: ListView.separated(
              // 3
              scrollDirection: Axis.horizontal,
              // 4
              itemCount: recipes.length,
              // 5
              itemBuilder: (context, index) {
                // 6
                var recipe = recipes[index];
                return buildCard(recipe);
              },
              // 7
              separatorBuilder: (context, index) {
                // 8
                return SizedBox(width: 16);
              },
            ),
          )
        ]));
  }

  buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception("This card doesn't exist yet");
    }
  }
}
