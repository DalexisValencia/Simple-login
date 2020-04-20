import 'package:flutter/material.dart';
import 'package:third_test_app/pages/circle.dart';
import 'package:third_test_app/pages/header.dart';
import 'package:third_test_app/widgets/button.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:third_test_app/widgets/input.dart';

class LoginScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: StackedHead()
          ),
          Positioned(
            top: MediaQuery.of(context).size.height *0.13,
            // child: Header(),
            child: HeaderCustom(
              title: 'LOG IN',
              titleColor: Theme.of(context).primaryColorDark,
              subtitle: 'TO CONTINUE',
              subtitleColor: Theme.of(context).accentColor
            )
          ),
          Positioned(
            bottom: 0,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
                child: LoginForm(),
            )
          )
        ],
      ),
    );
  }
}
class StackedHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
    children: <Widget>[
      Positioned(
        top: -MediaQuery.of(context).size.width*0.40,
        left: -MediaQuery.of(context).size.width*0.25,
        child: CircleGradient(
          width: MediaQuery.of(context).size.width + 45,
          height: MediaQuery.of(context).size.width + 45,
          background: 'gradient',
          colors: [Theme.of(context).hoverColor, Theme.of(context).primaryColorLight],
          radius: MediaQuery.of(context).size.width,
          gradiendStart: Alignment.topRight,
          gradientEnd: Alignment.bottomRight,
          border: null 
        ),
      ),
      Positioned(
        top: - MediaQuery.of(context).size.width*0.13,
        right: MediaQuery.of(context).size.width*0.10,
        child: CircleGradient(
          width: MediaQuery.of(context).size.width*0.75,
          height: MediaQuery.of(context).size.width*0.75,  
          background: 'plane',
          colors: [Color(0x00000000)],
          radius: MediaQuery.of(context).size.width,
          gradiendStart: null,
          gradientEnd: null,
          border: Border.all(
            width: 3,
            color: Theme.of(context).primaryColorDark
          ), 
        ),
      ),
      Positioned(
        top: -MediaQuery.of(context).size.width*0.12,
        left: -MediaQuery.of(context).size.width*0.1,
        child: CircleGradient(
          width: MediaQuery.of(context).size.width*0.37,
          height: MediaQuery.of(context).size.width*0.37,  
          background: 'gradient',
          colors: [Theme.of(context).hoverColor, Theme.of(context).primaryColorLight],
          radius: MediaQuery.of(context).size.width*0.70,
          gradiendStart: Alignment.topLeft,
          gradientEnd: Alignment.bottomRight,
          border: null, 
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.width*0.31,
        left: MediaQuery.of(context).size.width*0.04,
        child: CircleGradient(
          width: MediaQuery.of(context).size.width*0.11,
          height: MediaQuery.of(context).size.width*0.11,  
          background: 'gradient',
          colors: [Theme.of(context).hoverColor, Theme.of(context).primaryColorLight],
          radius: MediaQuery.of(context).size.width,
          gradiendStart: Alignment.topRight,
          gradientEnd: Alignment.bottomLeft,
          border: null, 
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.width*0.11,
        right: MediaQuery.of(context).size.width*0.26,
        child: CircleGradient(
          width: MediaQuery.of(context).size.width*0.05,
          height: MediaQuery.of(context).size.width*0.05,  
          background: 'gradient',
          colors: [Theme.of(context).hoverColor, Theme.of(context).primaryColorDark],
          radius: MediaQuery.of(context).size.width,
          gradiendStart: Alignment.topRight,
          gradientEnd: Alignment.bottomLeft,
          border: null, 
        ),
      )
    ]  
  );
}
}


class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  bool keyBoardState = false;
  TextEditingController user;
  TextEditingController pass;
  FocusNode focusLoginUser;
  FocusNode focusLoginPass;

  finish() {
    FocusScope.of(context).requestFocus(new FocusNode());
    print(user.text);
    print(pass.text);
  }
  
  next() {
    FocusScope.of(context).requestFocus(focusLoginPass);
  }

  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          keyBoardState = visible;
        });
      },
    );

    user = TextEditingController();
    pass = TextEditingController();
    focusLoginUser = FocusNode();
    focusLoginPass = FocusNode();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,//  *0.73
      padding: EdgeInsets.only(
        left:MediaQuery.of(context).size.width*0.15,
        right:MediaQuery.of(context).size.width*0.15
      ),
      margin: EdgeInsets.only(
        bottom: keyBoardState == true ? 0 : MediaQuery.of(context).size.height*0.13
      ),
      decoration: BoxDecoration(
        // border: Border.all(
        //   width: 2,
        //   color: Colors.red
        // )
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFieldCustom(
              color: Theme.of(context).primaryColorDark,
              hintText: 'Username',
              textFocus: focusLoginUser,
              textController: user,
              helperText: null,
              obscureText: false,
              submit: () => next(),
              inputAction: TextInputAction.next,
            ),
            TextFieldCustom(
              color: Theme.of(context).primaryColorDark,
              hintText: 'Password',
              textFocus: focusLoginPass,
              textController: pass,
              helperText: 'Forgot?',
              obscureText: true,
              submit: () => finish(),
              inputAction: TextInputAction.send,
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.width*0.10
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).hoverColor
                  ]
                ),
                borderRadius: BorderRadius.circular(40)
              ),
              width: MediaQuery.of(context).size.width *0.73,
              child: WidgetButton(
                  child: Text(
                    "LOG IN",
                    style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).accentColor
                    ),
                  ),
                  splashColor: Theme.of(context).accentColor,
                  bgColor: Color(0x000000),
                  onpressed: () => finish(),
              )
            )
            
          ],
        )
      ),
    );
  }
}