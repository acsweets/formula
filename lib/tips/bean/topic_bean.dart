/// Author:      星星
/// CreateTime:  2024/7/15
/// Contact Me:  1395723441@qq.com

class Topic {
  final String? name;
  final String? answer;
  final int? difficulty;
  final int? important;
  final String? type;

  Topic({this.name, this.answer, this.difficulty, this.important, this.type});

  factory Topic.formJson(Map<String, dynamic> map) {
    return Topic(
        name: map["name"],
        answer: map["answer"],
        difficulty: map["difficulty"],
        type: map["type"],
        important: map["important"]);
  }
}
