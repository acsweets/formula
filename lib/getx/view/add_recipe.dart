/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/recipe_controller.dart';
import '../models/recipe.dart';


class AddRecipeView extends StatelessWidget {
  final RecipeController recipeController = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cookingTimeController = TextEditingController();
  final TextEditingController difficultyController = TextEditingController();
  final TextEditingController servingsController = TextEditingController();

  AddRecipeView({super.key});
  // 可以为其他字段创建更多的控制器

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加食谱'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: '食谱名称'),
            ),
            TextField(
              controller: cookingTimeController,
              decoration: InputDecoration(labelText: '制作时间'),
            ),
            TextField(
              controller: difficultyController,
              decoration: InputDecoration(labelText: '难度等级'),
            ),
            TextField(
              controller: servingsController,
              decoration: InputDecoration(labelText: '份量'),
            ),
            ElevatedButton(
              onPressed: () {
                final recipe = Recipe(
                  name: nameController.text,
                  cookingTime: cookingTimeController.text,
                  difficulty: difficultyController.text,
                  servings: int.parse(servingsController.text),
                  ingredients: [],
                  steps: [],
                  category: '',
                  calories: 0,
                  tags: [],
                  imageUrl: '',
                  stepImages: [],
                  stepVideos: [],
                  isFavorite: false,
                  userRating: 0,
                  comments: [],
                  createdDate: DateTime.now(),
                  lastModifiedDate: DateTime.now(),
                  author: 'Author', // 需要从用户输入或用户信息中获取
                );
                recipeController.addRecipe(recipe);
                Get.back();
              },
              child: Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
