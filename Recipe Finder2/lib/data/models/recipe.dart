import 'package:equatable/equatable.dart';

import 'ingredient.dart';

class Recipe extends Equatable {
  int id;
  List<Ingredient> ingredients;

  final String url;
  final String label;
  final String image;

  final double calories;
  final double totalTime;
  final double totalWeight;

  Recipe({
    this.id,
    this.label,
    this.image,
    this.url,
    this.calories,
    this.totalWeight,
    this.totalTime,
  });

  @override
  List<Object> get props =>
      [label, image, url, calories, totalWeight, totalTime];

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json['recipeId'],
        label: json['label'],
        image: json['image'],
        url: json['url'],
        calories: json['calories'],
        totalWeight: json['totalWeight'],
        totalTime: json['totalTime'],
      );

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
