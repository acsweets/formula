/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com


class Recipe {
  final String name;
  final String cookingTime;
  final String difficulty;
  final int servings;
  final List<Ingredient> ingredients;
  final List<Step> steps;
  final String category;
  final int calories;
  final List<String> tags;
  final String imageUrl;
  final List<String> stepImages;
  final List<String> stepVideos;
  final bool isFavorite;
  final double userRating;
  final List<Comment> comments;
  final DateTime createdDate;
  final DateTime lastModifiedDate;
  final String author;

  Recipe({
    required this.name,
    required this.cookingTime,
    required this.difficulty,
    required this.servings,
    required this.ingredients,
    required this.steps,
    required this.category,
    required this.calories,
    required this.tags,
    required this.imageUrl,
    required this.stepImages,
    required this.stepVideos,
    required this.isFavorite,
    required this.userRating,
    required this.comments,
    required this.createdDate,
    required this.lastModifiedDate,
    required this.author,
  });
}

class Ingredient {
  final String name;
  final double quantity;
  final String unit;

  Ingredient({
    required this.name,
    required this.quantity,
    required this.unit,
  });
}

class Step {
  final int order;
  final String description;

  Step({
    required this.order,
    required this.description,
  });
}

class Comment {
  final String user;
  final String content;
  final DateTime date;

  Comment({
    required this.user,
    required this.content,
    required this.date,
  });
}
