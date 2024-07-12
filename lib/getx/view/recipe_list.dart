/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com

import 'package:flutter/material.dart';
import 'package:formula/getx/view/recipe_detail.dart';
import 'package:get/get.dart';

import '../controller/recipe_controller.dart';
import '../models/recipe.dart';

class RecipeListView extends StatelessWidget {
  RecipeListView({super.key});

  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('食谱列表'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: recipeController.recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipeController.recipes[index];
            return ListTile(
              title: Text(recipe.name),
              subtitle: Text('${recipe.cookingTime} | ${recipe.difficulty}'),
              onTap: () {
                Get.to(() => RecipeDetailView(), arguments: recipe);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
