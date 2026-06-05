import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Exercise',
      home: CounterPage(),
    );
  }
}

// A StatefulWidget is required because state changes (counter, background color)
class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  static const List<Color> colors = [Colors.white,Colors.red, Colors.orange,Colors.yellow,Colors.green,Colors.blue,Colors.purple];

  Color currentColor = colors[0];

  void _increment() {
    setState(() {
      counter++;

      currentColor = colors[counter % colors.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = ThemeData.estimateBrightnessForColor(currentColor);
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;
    
    return Scaffold(
      backgroundColor: currentColor,
      appBar: AppBar(title: Text("Counter + Color Exercise")),

      body: Center(
        child: Text(
          'Count: $counter',
          style: TextStyle(
            fontSize: 24,
            color: textColor,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _increment, // Calls increment function
        child: Icon(Icons.add),
      ),
    );
  }
}