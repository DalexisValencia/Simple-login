import 'package:flutter/material.dart';
import 'package:third_test_app/widgets/form__circleGradient.dart';

class RegisterCircleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleGradient(
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.width * 0.80,
      background: 'plane',
      colors: [
        Color(0x000000),
      ],
      radius: MediaQuery.of(context).size.height,
      gradiendStart: Alignment.topRight,
      gradientEnd: Alignment.bottomRight,
      border: Border.all(
        width: 3,
        color: Theme.of(context).hoverColor,
      ),
    );
  }
}
