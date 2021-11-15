import 'package:equatable/equatable.dart';
import 'ingredient.dart';

class Recipe extends Equatable {
  // 1
  int id;
  final String label;
  final String image;
  final String url;
  // 2
  List<Ingredient> ingredients;
  final double calories;
  final double totalWeight;
  final double totalTime;

  // 3
  Recipe({
    this.id,
    this.label,
    this.image,
    this.url,
    this.calories,
    this.totalWeight,
    this.totalTime,
  });

  // 4
  @override
  List<Object> get props =>
      [label, image, url, calories, totalWeight, totalTime];

  // Create a Recipe from JSON data
  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json['recipeId'],
        label: json['label'],
        image: json['image'],
        url: json['url'],
        calories: json['calories'],
        totalWeight: json['totalWeight'],
        totalTime: json['totalTime'],
      );

// Convert our Recipe to JSON to make it easier when you store
// it in the database
  Map<String, dynamic> toJson() => {
        'recipeId': id,
        'label': label,
        'image': image,
        'url': url,
        'calories': calories,
        'totalWeight': totalWeight,
        'totalTime': totalTime,
      };
}
