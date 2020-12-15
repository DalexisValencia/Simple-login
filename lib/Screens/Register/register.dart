import 'package:flutter/material.dart';
import 'package:third_test_app/Screens/Register/components/register__circleHeader.dart';
import 'package:third_test_app/Screens/Register/components/register__form.dart';
import 'package:third_test_app/widgets/form__header.dart';

class RegisterScaffold extends StatelessWidget {
  final bool animatedOpacityProp;
  RegisterScaffold({this.animatedOpacityProp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterPage(
        animatedOpacityProp: animatedOpacityProp,
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  final bool animatedOpacityProp;
  RegisterPage({
    this.animatedOpacityProp,
  });
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with WidgetsBindingObserver {
  bool animatedOpacity = false;

  void changeState(state) {
    setState(() {
      animatedOpacity = state;
    });
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    // If user resumed to this app, check permission
    if (state == AppLifecycleState.resumed) {
      // checkPermission();
    }
  }

  @override
  void initState() {
    changeState(widget.animatedOpacityProp);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => changeState(true));
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -MediaQuery.of(context).size.width * 0.18,
            right: -MediaQuery.of(context).size.width * 0.15,
            child: RegisterCircleHeader(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.18,
            child: AnimatedOpacity(
              duration: Duration(
                milliseconds: 800,
              ),
              opacity: animatedOpacity ? 1 : 0.0,
              child: AnimatedOpacity(
                opacity: animatedOpacity ? 1 : 0.0,
                duration: Duration(milliseconds: 800),
                child: FormHeader(
                  title: 'REGISTER',
                  titleColor: Theme.of(context).hoverColor,
                  subtitle: 'TO CONTINUE',
                  subtitleColor: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedOpacity(
              opacity: animatedOpacity ? 1 : 0,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: FormRegister(),
              ),
              duration: Duration(
                milliseconds: 800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
