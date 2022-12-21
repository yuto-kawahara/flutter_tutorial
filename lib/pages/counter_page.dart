import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class CountData extends ChangeNotifier {
//   int counter = 1;

//   void increment() {
//     counter = counter + 1;
//     notifyListeners();
//   }

//   void double() {
//     counter = counter * 2;
//     notifyListeners();
//   }
// }

class CountData2 extends ChangeNotifier {
  int counter = 1;

  void increment() {
    counter = counter + 1;
    notifyListeners();
  }

  void double() {
    counter = counter * 2;
    notifyListeners();
  }
}

class CounterPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountData2>(
        create: (context) => CountData2(),
        child: Center(
          child: ChildWidget(),
        ));
  }
}

class ChildWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final CountData2 data = Provider.of(context);

    return Stack(
      children: [
        Center(
          child: Text('count is ${data.counter.toString()}'),
        ),
        Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              data.increment();
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}