/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com

import 'package:get/get.dart';

import '../models/recipe.dart';


class RecipeController extends GetxController {
  var recipes = <Recipe>[].obs;

  void addRecipe(Recipe recipe) {
    recipes.add(recipe);
  }

  void updateRecipe(int index, Recipe recipe) {
    recipes[index] = recipe;
  }

  void deleteRecipe(int index) {
    recipes.removeAt(index);
  }
}
