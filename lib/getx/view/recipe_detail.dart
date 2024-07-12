/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/recipe.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('制作时间: ${recipe.cookingTime}'),
            Text('难度等级: ${recipe.difficulty}'),
            Text('份量: ${recipe.servings}人份'),
            // 显示更多的食谱信息
          ],
        ),
      ),
    );
  }
}
