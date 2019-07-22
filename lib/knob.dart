library knob;

import 'package:flutter/material.dart';
import 'dart:math';

class Knob extends StatefulWidget {

  // Define the parameters of this widget
  final double value;
  final double min;
  final double max;

  // Two extra parameters to make the widget more easy to customise
  final double size;
  final Color color;

  // ValueChanged is a type built into Dart for a function that changes a value
  final ValueChanged<double> onChanged;

  // Define a build method for the widget which uses these parameters
  Knob({this.value, this.min = 0, this.max = 1, this.color = Colors.blue, this.size = 50, this.onChanged});

  @override
  State<StatefulWidget> createState() => KnobState();
}

class KnobState extends State<Knob> {

  // These are static constants because they are in internal parameters of the knob that
  // can't be changed from the outside
  static const double minAngle = -160;
  static const double maxAngle = 160;
  static const double sweepAngle = maxAngle - minAngle;
  
  @override
  Widget build(BuildContext context) {
    // distanceToAngle now depends on potentially non-constant parameters,
    // so must be defined in the build method
    double distanceToAngle = 0.007 * (widget.max - widget.min);

    double normalisedValue = (widget.value - widget.min)/(widget.max - widget.min);
    double angle = (minAngle + normalisedValue * sweepAngle) * 2 * pi / 360;
    double size = widget.size;
    return Center(
      child: Container(
        width: size,
        height: size,
        child: Transform.rotate(
          angle: angle,
          child: GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails details) {
              double changeInY = -details.delta.dy;
              double changeInValue = distanceToAngle * changeInY;
              double newValue = widget.value + changeInValue;
              double clippedValue = min(max(newValue, widget.min), widget.max);

              widget.onChanged(clippedValue);
            },
            child: ClipOval(
              child: Container(
                color: widget.color,
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: size,
                )
              )
            ),
          ),
        ),
      ),
    );
  }
}