/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com


import 'package:flutter/material.dart';
import 'package:formula/provider/recipe/edit/recipe_edit_provier.dart';
import 'package:provider/provider.dart';

import '../../../models/recipe.dart';
import '../list/recipe_provider.dart';


class RecipeEditScreen extends StatelessWidget {
  final Recipe? recipe;

  RecipeEditScreen({super.key, this.recipe});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecipeEditProvider>.value(
      value: RecipeEditProvider(recipe),
      child: _RecipeEditForm(),
    );
  }
}

class _RecipeEditForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final editProvider = Provider.of<RecipeEditProvider>(context);
    final recipe = editProvider.recipe;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.id.isEmpty ? 'Add Recipe' : 'Edit Recipe'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _saveRecipe(context),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: recipe.name,
                decoration: InputDecoration(labelText: 'Recipe Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a recipe name';
                  }
                  return null;
                },
                onChanged: (value) => editProvider.updateName(value),
              ),
              TextFormField(
                initialValue: recipe.prepTime.toString(),
                decoration: InputDecoration(labelText: 'Prep Time (minutes)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter prep time';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                // onChanged: (value) => editProvider.updatePrepTime(int.parse(value)),
              ),
              DropdownButtonFormField<String>(
                value: recipe.difficulty,
                decoration: InputDecoration(labelText: 'Difficulty'),
                items: ['Easy', 'Medium', 'Hard'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => editProvider.updateDifficulty(value!),
              ),
              TextFormField(
                initialValue: recipe.servings.toString(),
                decoration: InputDecoration(labelText: 'Servings'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of servings';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                // onChanged: (value) => editProvider.updateServings(int.parse(value)),
              ),
              TextFormField(
                initialValue: recipe.category,
                decoration: InputDecoration(labelText: 'Category'),
                onChanged: (value) => editProvider.updateCategory(value),
              ),
              TextFormField(
                initialValue: recipe.calories.toString(),
                decoration: InputDecoration(labelText: 'Calories'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value != null && value.isNotEmpty && int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onChanged: (value) => editProvider.updateCalories(int.parse(value.isEmpty ? '0' : value)),
              ),
              // 在这里可以添加配料和步骤的输入字段
            ],
          ),
        ),
      ),
    );
  }

  void _saveRecipe(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final editProvider = Provider.of<RecipeEditProvider>(context, listen: false);
      final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);

      final recipe = editProvider.recipe;
      if (recipe.id.isEmpty) {
        recipeProvider.addRecipe(recipe);
      } else {
        recipeProvider.updateRecipe(recipe);
      }

      Navigator.pop(context);
    }
  }
}