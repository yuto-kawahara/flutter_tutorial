import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/notifier.dart';

class CountPage extends ConsumerWidget {
  const CountPage({Key? key}) : super(key: key);
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);


    return Container(
      child: Center(
          child: Column(children: [
        Text('count is $count'),
        Container(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              ref.read(countProvider.notifier).update((state) => state + 1);
            },
            child: Icon(Icons.add),
          ),
        )
      ])),
    );
  }
}
