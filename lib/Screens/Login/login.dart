import 'package:flutter/material.dart';
import 'package:third_test_app/Screens/Login/components/login__circleHeader.dart';
import 'package:third_test_app/Screens/Login/components/login__form.dart';
import 'package:third_test_app/widgets/form__header.dart';

class LoginScaffold extends StatelessWidget {
  final bool animtedOpacityProp;
  LoginScaffold({
    this.animtedOpacityProp,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: LoginPage(
        animtedOpacityProp: animtedOpacityProp,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  final bool animtedOpacityProp;
  LoginPage({
    this.animtedOpacityProp,
  });
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  bool animatedOpacityState = true;
  void setAnimationState(state) {
    setState(() {
      animatedOpacityState = state;
    });
  }

  void setTest() {
    print('segunda final');
    setAnimationState(false);
  }

  void yourFunction(context) {
    // print(mounted);
    setAnimationState(true);
    // setAnimationState(true);
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    // If user resumed to this app, check permission
    if (state == AppLifecycleState.resumed) {
      // checkPermission();
    }
  }

  @override
  void initState() {
    setAnimationState(widget.animtedOpacityProp);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => yourFunction(context));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: CircleHeader(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.13,
            child: AnimatedOpacity(
              opacity: animatedOpacityState ? 1 : 0,
              child: FormHeader(
                title: 'LOG IN',
                titleColor: Theme.of(context).primaryColorDark,
                subtitle: 'TO CONTINUE',
                subtitleColor: Theme.of(context).accentColor,
              ),
              duration: Duration(
                milliseconds: 600,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedOpacity(
              opacity: animatedOpacityState ? 1 : 0,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: LoginForm(),
              ),
              duration: Duration(
                milliseconds: 600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
