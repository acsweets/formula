import 'package:flutter/material.dart';
import 'package:formula/provider/recipe/list/recipe_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/recipe.dart';
import '../edit/recipe_edit_page.dart';

/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe List')),
      body: Consumer<RecipeProvider>(
        builder: (context, recipeProvider, child) {
          final recipes = recipeProvider.recipes;
          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return ListTile(
                title: Text(recipe.name),
                subtitle: Text('${recipe.difficulty} • ${recipe.prepTime} mins'),
                trailing: IconButton(
                  icon: Icon(
                    recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: recipe.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    recipeProvider.toggleFavorite(recipe.id);
                  },
                ),
                onTap: () {
                  // 导航到食谱详情页面
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 添加新食谱的逻辑
          // final newRecipe = Recipe(
          //   id: DateTime.now().toString(),
          //   name: 'New Recipe',
          //   prepTime: 30,
          //   difficulty: 'Medium',
          //   servings: 4,
          //   ingredients: [],
          //   steps: [],
          //   category: 'Main Dish',
          // );
          // Provider.of<RecipeProvider>(context, listen: false).addRecipe(newRecipe);
          Navigator.push(context, MaterialPageRoute(builder: (_) => RecipeEditScreen()));
        },
      ),
    );
  }
}
