import 'dart:async';
import 'package:flutter/material.dart';
import 'package:third_test_app/Screens/Welcome/body/welcome__body.dart';
import 'package:third_test_app/Screens/Welcome/loading/welcome__loading.dart';

class WelcomeScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with WidgetsBindingObserver {
  bool animatedOpacity = false;
  bool showScreen = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // went to Background
    }
    if (state == AppLifecycleState.resumed) {
      // came back to Foreground
    }
  }

  exampleAnimation(state) {
    setState(() {
      animatedOpacity = state;
    });
  }

  justInCase() {
    print("Volvimos a la vista welcome");
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => justInCase());
    Future.delayed(
        Duration(
          milliseconds: 2000,
        ), () {
      setState(() {
        showScreen = true;
      });
      Future.delayed(
          Duration(
            milliseconds: 500,
          ), () {
        print("Despúes de un segundo");
        setState(() {
          animatedOpacity = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).hoverColor,
            Theme.of(context).primaryColorLight
          ],
          stops: [0.2, 0.9],
        ),
      ),
      child: Column(
        children: <Widget>[
          showScreen == false
              ? LoadingWelcome()
              : WelcomeBody(
                  animatedOpacity: animatedOpacity,
                )
        ],
      ),
    );
  }
}
