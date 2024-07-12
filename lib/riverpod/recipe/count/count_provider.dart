/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

//
// part 'counter_model.g.dart';
// @riverpod
// class Counter extends _$Counter {
//   @override
//   int build() => 0;
//
//   void increment() => state++;
// }

class Counter extends AutoDisposeNotifier<int> {
  @override
  int build() => 0;

  /// int 就是这个状态
  void increment() => state++;

  void add(){
   int a =  ref.read(counterProvider) ;
  }
}

final counterProvider = AutoDisposeNotifierProvider<Counter, int>(Counter.new);

class CounterText extends ConsumerWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      '${ref.watch(counterProvider)}',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
