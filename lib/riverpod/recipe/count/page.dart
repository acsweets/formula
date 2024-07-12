import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'count_provider.dart';

/// Author:      星星
/// CreateTime:  2024/7/12
/// Contact Me:  1395723441@qq.com


class SecretFetchButton extends ConsumerWidget {
  const SecretFetchButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     var count = ref.watch(counterProvider);

    return IconButton(onPressed:  count.when(


    ), icon: Container());

  }}