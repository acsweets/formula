// import '../../../models/recipe.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// /// Author:      星星
// /// CreateTime:  2024/7/12
// /// Contact Me:  1395723441@qq.com
//
// part 'recipe_provider.g.dart';
// @riverpod
// class RecipeNotifier extends _$RecipeNotifier {
//
//   @override
//   List<Recipe> build() {
//     return []; // 初始状态为空列表
//   }
//
//   void addRecipe(Recipe recipe) {
//     state = [...state, recipe];
//   }
//
//   void removeRecipe(String id) {
//     state = state.where((recipe) => recipe.id != id).toList();
//   }
//
//   void toggleFavorite(String id) {
//     state = state.map((recipe) {
//       if (recipe.id == id) {
//         return recipe.copyWith(isFavorite: !recipe.isFavorite);
//       }
//       return recipe;
//     }).toList();
//   }
//
//   void rateRecipe(String id, double rating) {
//     state = state.map((recipe) {
//       if (recipe.id == id) {
//         return recipe.copyWith(userRating: rating);
//       }
//       return recipe;
//     }).toList();
//   }
//
//
// }