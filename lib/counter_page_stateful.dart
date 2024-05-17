import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter page'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Counter value $_counter',
          style: const TextStyle(
            fontSize: 23,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter -= 1;
              });
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 13,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter += 1;
              });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
