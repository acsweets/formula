/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com

import 'package:flutter/material.dart';
import 'package:formula/getx/view/add_recipe.dart';
import 'package:formula/getx/view/recipe_detail.dart';
import 'package:formula/getx/view/recipe_list.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '食谱应用',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => RecipeListView()),
        GetPage(name: '/add', page: () => AddRecipeView()),
        GetPage(name: '/detail', page: () => RecipeDetailView()),

        // 其他页面的路由也可以在这里添加
      ],
    );
  }
}
