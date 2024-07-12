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

// class Counter extends AutoDisposeNotifier<int> {
//   @override
//   int build() => 0;
//
//   /// int 就是这个状态
//   void increment() => state++;
//
//   void add(){
//    int a =  ref.read(counterProvider) ;
//   }
// }

class Counter extends AutoDisposeAsyncNotifier<int> {
  //  AsyncValue 值的类型变成 可以使用 watch  when
  // 操作 state.value
  @override
  int build() => 0;

  /// int 就是这个状态
  void increment() => state.value;

  void add() {
    state.value! - 1;
  }
}

// final counterProvider = AutoDisposeNotifierProvider<Counter, int>(Counter.new,);
final counterProvider = AutoDisposeAsyncNotifierProvider<Counter, int>(
  Counter.new,
);

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

///Provider
final stringProvider = Provider<String>((ref) {
  return 'Hello, Riverpod!';
});

///StateProvider
final countProvider = StateProvider<int>((ref) {
  return 0;
});

final indexProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() => state++;

  void decrement() => state--;
}

final dataProvider = FutureProvider<String>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 'Hello, Future!';
});

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(Duration(seconds: 1), (count) => count);
});
final changeProvider = ChangeNotifierProvider<ChangeCounter>((ref) {
  return ChangeCounter();
});

class ChangeCounter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

final autoDisposeProvider = Provider.autoDispose<String>((ref) {
  return 'This will be auto disposed!';
});

final weatherProvider = AutoDisposeAsyncNotifierProvider<WeatherNotifier, String>(WeatherNotifier.new);

Future<String> fetchWeather() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Sunny, 25°C';
}
// AutoDisposeAsyncNotifier 是asyncValue的数据 可以使用 when

class WeatherNotifier extends AutoDisposeAsyncNotifier<String> {
  @override
  Future<String> build() async {
    return await fetchWeather();
  }

  // 可以添加其他方法来触发不同的异步操作
  Future<void> refreshWeather() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await fetchWeather();
    });
  }
}
