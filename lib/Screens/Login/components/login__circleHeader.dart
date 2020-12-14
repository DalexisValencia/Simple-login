import 'package:flutter/material.dart';
import 'package:third_test_app/widgets/form__circleGradient.dart';

class CircleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -MediaQuery.of(context).size.width * 0.40,
          left: -MediaQuery.of(context).size.width * 0.25,
          child: CircleGradient(
            width: MediaQuery.of(context).size.width + 45,
            height: MediaQuery.of(context).size.width + 45,
            background: 'gradient',
            colors: [
              Theme.of(context).hoverColor,
              Theme.of(context).primaryColorLight
            ],
            radius: MediaQuery.of(context).size.width,
            gradiendStart: Alignment.topRight,
            gradientEnd: Alignment.bottomRight,
            border: null,
          ),
        ),
        Positioned(
          top: -MediaQuery.of(context).size.width * 0.13,
          right: MediaQuery.of(context).size.width * 0.10,
          child: CircleGradient(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.width * 0.75,
            background: 'plane',
            colors: [
              Color(0x00000000),
            ],
            radius: MediaQuery.of(context).size.width,
            gradiendStart: null,
            gradientEnd: null,
            border: Border.all(
              width: 3,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
        Positioned(
          top: -MediaQuery.of(context).size.width * 0.12,
          left: -MediaQuery.of(context).size.width * 0.1,
          child: CircleGradient(
            width: MediaQuery.of(context).size.width * 0.37,
            height: MediaQuery.of(context).size.width * 0.37,
            background: 'gradient',
            colors: [
              Theme.of(context).hoverColor,
              Theme.of(context).primaryColorLight
            ],
            radius: MediaQuery.of(context).size.width * 0.70,
            gradiendStart: Alignment.topLeft,
            gradientEnd: Alignment.bottomRight,
            border: null,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.width * 0.31,
          left: MediaQuery.of(context).size.width * 0.04,
          child: CircleGradient(
            width: MediaQuery.of(context).size.width * 0.11,
            height: MediaQuery.of(context).size.width * 0.11,
            background: 'gradient',
            colors: [
              Theme.of(context).hoverColor,
              Theme.of(context).primaryColorLight
            ],
            radius: MediaQuery.of(context).size.width,
            gradiendStart: Alignment.topRight,
            gradientEnd: Alignment.bottomLeft,
            border: null,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.width * 0.11,
          right: MediaQuery.of(context).size.width * 0.26,
          child: CircleGradient(
            width: MediaQuery.of(context).size.width * 0.05,
            height: MediaQuery.of(context).size.width * 0.05,
            background: 'gradient',
            colors: [
              Theme.of(context).hoverColor,
              Theme.of(context).primaryColorDark
            ],
            radius: MediaQuery.of(context).size.width,
            gradiendStart: Alignment.topRight,
            gradientEnd: Alignment.bottomLeft,
            border: null,
          ),
        )
      ],
    );
  }
}
