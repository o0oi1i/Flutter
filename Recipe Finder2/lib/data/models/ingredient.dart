import 'package:equatable/equatable.dart';

// 1
class Ingredient extends Equatable {
  // 2
  int id;
  int recipeId;
  final String name;
  final double weight;

  // 3
  Ingredient({this.id, this.recipeId, this.name, this.weight});

  // 4
  @override
  List<Object> get props => [recipeId, name, weight];

  // Create a Ingredient from JSON data
  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json['ingredientId'],
        recipeId: json['recipeId'],
        name: json['name'],
        weight: json['weight'],
      );

// Convert our Ingredient to JSON to make it easier when you
// store it in the database
  Map<String, dynamic> toJson() => {
        'ingredientId': id,
        'recipeId': recipeId,
        'name': name,
        'weight': weight,
      };
}
