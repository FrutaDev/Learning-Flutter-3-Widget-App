import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentations/providers/theme_provider.dart';

import '../../providers/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = "counter_screen";

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int listenedCounter = ref.watch(counterProvider);
    final bool listenedTheme = ref.watch(isDarkModeProvider);

    final textStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((prev) => !prev);
            },
            icon: Icon(listenedTheme ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contador: ", style: textStyle),
            Text("$listenedCounter", style: textStyle),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state = 0;
            },
            child: Icon(Icons.refresh_rounded),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).update((prev) => prev + 1);
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
