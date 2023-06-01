import 'package:flutter/material.dart';
import 'package:odev/utils/drawer.dart';

class CounterPlus extends StatefulWidget {
  const CounterPlus({super.key});

  @override
  State<CounterPlus> createState() => _CounterPlusState();
}

class _CounterPlusState extends State<CounterPlus> {
  double _fontSize = 50.0;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    if (_counter > 0) {
      textColor = Colors.green;
    } else if (_counter == 0) {
      textColor = Colors.black;
    } else if (_counter < 0) {
      textColor = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayaç Uygulaması'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _incrementCounter,
              hoverColor: Colors.grey,
              backgroundColor: textColor,
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: _fontSize,
                color: textColor,
              ),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              onPressed: _decrementCounter,
              hoverColor: Colors.grey,
              backgroundColor: textColor,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onLongPress: _decreaseFontSize,
        child: FloatingActionButton(
          onPressed: _increaseFontSize,
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 5.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize -= 5.0;
    });
  }
}
