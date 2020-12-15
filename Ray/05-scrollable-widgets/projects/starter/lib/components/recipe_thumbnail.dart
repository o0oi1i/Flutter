import 'package:flutter/material.dart';
import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  // 1
  final SimpleRecipe recipe;

  const RecipeThumbnail({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2
    return Container(
      padding: EdgeInsets.all(8),
      // 3
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 4
          Expanded(
            child: Container(
              // 5
              child: ClipRRect(
                child: Image.asset(
                  "${recipe.dishImage}",
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          // 6
          SizedBox(height: 10),
          // 7
          Text(
            recipe.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
