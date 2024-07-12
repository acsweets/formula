// /// Author:      星星
// /// CreateTime:  2024/7/12
// /// Contact Me:  1395723441@qq.com
//
//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// import '../../../models/recipe.dart';
//
// part 'recipe_provider.g.dart';
//
// @riverpod
// class RecipeNotifier extends _$RecipeNotifier {
//   @override
//   List<Recipe> build() {
//     return [];
//   }
//
//   void addRecipe(Recipe recipe) {
//     state = [...state, recipe];
//   }
//
//   void updateRecipe(int index, Recipe recipe) {
//     state = [
//       for (int i = 0; i < state.length; i++)
//         if (i == index) recipe else state[i]
//     ];
//   }
//
//   void deleteRecipe(int index) {
//     state = [
//       for (int i = 0; i < state.length; i++)
//         if (i != index) state[i]
//     ];
//   }
// }
