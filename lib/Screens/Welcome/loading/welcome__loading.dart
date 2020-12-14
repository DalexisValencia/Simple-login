import 'package:flutter/material.dart';

import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LoadingWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.43,
      ),
      child: Loading(
        indicator: BallPulseIndicator(),
        size: 100.0,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
