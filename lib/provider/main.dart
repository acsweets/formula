/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com

import 'package:flutter/material.dart';
import 'package:formula/provider/recipe/list/recipe_list_page.dart';
import 'package:formula/provider/recipe/list/recipe_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MaterialApp(
        title: 'Recipe App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RecipeListPage(),
      ),
    );
  }
}
