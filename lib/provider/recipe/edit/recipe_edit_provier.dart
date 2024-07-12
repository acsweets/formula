/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com

import 'package:flutter/foundation.dart';

import '../../../models/recipe.dart';

class RecipeEditProvider extends ChangeNotifier {
  Recipe _recipe;

  RecipeEditProvider(Recipe? recipe)
      : _recipe = recipe ??
      Recipe(
        id: DateTime.now().toString(),
        name: '',
        prepTime: 0,
        difficulty: 'Medium',
        servings: 1,
        ingredients: [],
        steps: [],
        category: '',
      );

  Recipe get recipe => _recipe;

  void updateName(String name) {
    _recipe = _recipe.copyWith(name: name);
    notifyListeners();
  }

  void updatePrepTime(int prepTime) {
    _recipe = _recipe.copyWith(prepTime: prepTime);
    notifyListeners();
  }

  void updateDifficulty(String difficulty) {
    _recipe = _recipe.copyWith(difficulty: difficulty);
    notifyListeners();
  }

  void updateServings(int servings) {
    _recipe = _recipe.copyWith(servings: servings);
    notifyListeners();
  }

  void updateCategory(String category) {
    _recipe = _recipe.copyWith(category: category);
    notifyListeners();
  }

  void updateCalories(int calories) {
    _recipe = _recipe.copyWith(calories: calories);
    notifyListeners();
  }

  void addIngredient(Ingredient ingredient) {
    _recipe = _recipe.copyWith(
      ingredients: [..._recipe.ingredients, ingredient],
    );
    notifyListeners();
  }

  void removeIngredient(int index) {
    final newIngredients = List<Ingredient>.from(_recipe.ingredients);
    newIngredients.removeAt(index);
    _recipe = _recipe.copyWith(ingredients: newIngredients);
    notifyListeners();
  }

  void addStep(String step) {
    _recipe = _recipe.copyWith(steps: [..._recipe.steps, step]);
    notifyListeners();
  }

  void removeStep(int index) {
    final newSteps = List<String>.from(_recipe.steps);
    newSteps.removeAt(index);
    _recipe = _recipe.copyWith(steps: newSteps);
    notifyListeners();
  }
}
