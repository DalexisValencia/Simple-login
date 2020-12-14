import 'package:flutter/material.dart';

class CircleGradient extends StatelessWidget {
  final double width;
  final double height;
  final String background;
  final List<Color> colors;
  final double radius;
  final Alignment gradiendStart;
  final Alignment gradientEnd;
  final Border border;
  CircleGradient({
    this.width,
    this.height,
    this.background,
    this.colors,
    this.radius,
    this.gradiendStart,
    this.gradientEnd,
    this.border
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background == 'plane' ? this.colors[0] : null,
        border: border, // null o border
        gradient: background == 'gradient' ?
          LinearGradient(
            begin: gradiendStart,
            end: gradientEnd,
            colors: this.colors
          ) : null ,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}