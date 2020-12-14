import 'package:flutter/material.dart';
import 'package:third_test_app/Screens/Welcome/body/components/body__footer.dart';
import 'package:third_test_app/Screens/Welcome/body/components/body__header.dart';

class WelcomeBody extends StatelessWidget {
  final bool animatedOpacity;
  WelcomeBody({
    this.animatedOpacity,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.20,
      ),
      height: MediaQuery.of(context).size.height * 0.73,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0x0000000),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AnimatedOpacity(
            opacity: animatedOpacity ? 1.0 : 0.0,
            duration: Duration(
              milliseconds: 800,
            ),
            child: WelcomeHeader(),
          ),
          AnimatedOpacity(
            opacity: animatedOpacity ? 1.0 : 0.0,
            duration: Duration(
              milliseconds: 800,
            ),
            child: WelcomeFooter(),
          )
        ],
      ),
    );
  }
}
