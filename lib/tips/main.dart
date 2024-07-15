import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'bean/topic_bean.dart';

/// Author:      星星
/// CreateTime:  2024/7/15
/// Contact Me:  1395723441@qq.com

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider(
        // create: (context) => RecipeProvider(),
        // child:
        MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Topic> topics = [];

  void _loadRecords() async {
    String src = await rootBundle.loadString('assets/data/taps.json');
    List data = jsonDecode(src) as List;
    setState(() {
      topics = data.map((e) => Topic.formJson(e)).toList();
    });
  }

  @override
  void initState() {
    _loadRecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("题目列表"),
      ),
      body: ListView.builder(
        itemBuilder: (_, i) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: ItemTopic(
                topic: topics[i],
              ));
        },
        itemCount: topics.length,
      ),
    );
  }
}

class ItemTopic extends StatefulWidget {
  final Topic topic;

  const ItemTopic({super.key, required this.topic});

  @override
  State<ItemTopic> createState() => _ItemTopicState();
}

class _ItemTopicState extends State<ItemTopic> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.topic.name}',
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              showAnswer = !showAnswer;
            });
          },
          child: Text(
            showAnswer ? "隐藏答案" : "显示答案",
            style: TextStyle(fontSize: 16, color: Colors.cyanAccent),
          ),
        ),
        Visibility(visible: showAnswer, child: Text('${widget.topic.answer}')),
      ],
    );
  }
}
