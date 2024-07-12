/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com

class Recipe {
  final String id;
  final String name;
  final int prepTime;
  final String difficulty;
  final int servings;
  final List<Ingredient> ingredients;
  final List<String> steps;
  final String category;
  final int calories;
  final List<String> tags;
  final String imageUrl;
  bool isFavorite;
  double userRating;

  Recipe({
    required this.id,
    required this.name,
    required this.prepTime,
    required this.difficulty,
    required this.servings,
    required this.ingredients,
    required this.steps,
    required this.category,
    this.calories = 0,
    this.tags = const [],
    this.imageUrl = '',
    this.isFavorite = false,
    this.userRating = 0.0,
  });


  Recipe copyWith({
    String? id,
    String? name,
    int? prepTime,
    String? difficulty,
    int? servings,
    List<Ingredient>? ingredients,
    List<String>? steps,
    String? category,
    int? calories,
    List<String>? tags,
    String? imageUrl,
    bool? isFavorite,
    double? userRating,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      prepTime: prepTime ?? this.prepTime,
      difficulty: difficulty ?? this.difficulty,
      servings: servings ?? this.servings,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      category: category ?? this.category,
      calories: calories ?? this.calories,
      tags: tags ?? this.tags,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      userRating: userRating ?? this.userRating,
    );
  }
}
//成分
class Ingredient {
  final String name;
  final double amount;
  final String unit;

  Ingredient({
    required this.name,
    required this.amount,
    required this.unit,
  });
}
