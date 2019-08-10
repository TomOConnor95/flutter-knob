# knob

A simple knob UI element.

## Getting Started

This package provides a Knob widget with a similar API as Flutter's Slider widget.

Working example:

```
import 'package:flutter/material.dart';

import 'package:flutter_knob/flutter_knob.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value = 0.0;
  void _setValue(double value) => setState(() => _value = value);
  static const double minValue = 0;
  static const double maxValue = 10;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Tutorial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Knob(
              value: _value,
              color: Colors.blue,
              onChanged: _setValue,
              min: minValue,
              max: maxValue,
              size: 50
            ),
            Slider(
                value: _value,
                onChanged: _setValue,
                min: minValue,
                max: maxValue),
            Text(
              'Value: ${_value.toStringAsFixed(3)}',
            ),
          ],
        ),
      ),
    );
  }
}
```

