import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:third_test_app/pages/circle.dart';
import 'package:third_test_app/pages/header.dart';
import 'package:third_test_app/widgets/button.dart';
import 'package:third_test_app/widgets/input.dart';

class RegisterScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -MediaQuery.of(context).size.width*0.18,
            right: -MediaQuery.of(context).size.width*0.15,
            child: CircleGradient(
              width: MediaQuery.of(context).size.width*0.80,
              height: MediaQuery.of(context).size.width*0.80,
              background: 'plane',
              colors: [Color(0x000000)],
              radius: MediaQuery.of(context).size.height,
              gradiendStart: Alignment.topRight,
              gradientEnd: Alignment.bottomRight,
              border: Border.all(
                width: 3,
                color: Theme.of(context).hoverColor
              ), 
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.18,
            child: HeaderCustom(
              title: 'SIGN UP',
              titleColor: Theme.of(context).hoverColor,
              subtitle: 'TO CONTINUE',
              subtitleColor: Theme.of(context).accentColor
            ),
          ),
          Positioned(
            bottom: 0,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: FormRegister(),
            ),
          )
        ],
      ),
    );
  }
}


class FormRegister extends StatefulWidget {
  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool keyBoardState = false;
  TextEditingController userController;
  TextEditingController emailController;
  TextEditingController passController;

  FocusNode userFocus;
  FocusNode emailFocus;
  FocusNode passFocus;

  nextInoput(next) {
    FocusScope.of(context).requestFocus(next);
  }

  finish() {
    print(userController.text);
    print(emailController.text);
    print(passController.text);
  }
  @override
  void initState() {
    super.initState();
    userController = TextEditingController(); 
    emailController =TextEditingController();
    passController = TextEditingController();

    userFocus = FocusNode();
    emailFocus = FocusNode();
    passFocus = FocusNode();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          keyBoardState = visible;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width*0.15,
        right: MediaQuery.of(context).size.width*0.15
      ),
      margin: EdgeInsets.only(
        bottom: keyBoardState == true ? 0 : MediaQuery.of(context).size.height*0.17
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFieldCustom(
              color: Theme.of(context).accentColor,
              hintText: 'Username',
              textFocus: userFocus,
              textController: userController,
              helperText: null,
              obscureText: false,
              submit: () => nextInoput(emailFocus),
              inputAction: TextInputAction.next,
            ),
            TextFieldCustom(
              color: Theme.of(context).accentColor,
              hintText: 'Email',
              textFocus: emailFocus,
              textController: emailController,
              helperText: null,
              obscureText: false,
              submit: () => nextInoput(passFocus),
              inputAction: TextInputAction.next,
            ),
            TextFieldCustom(
              color: Theme.of(context).accentColor,
              hintText: 'Password',
              textFocus: passFocus,
              textController: passController,
              helperText: null,
              obscureText: true,
              submit: () => finish(),
              inputAction: TextInputAction.send,
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *0.10
              ),
              width: MediaQuery.of(context).size.width *0.73,
              child: WidgetButton(
                  child: Text(
                    "SIGN UP",
                    style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                  splashColor: Theme.of(context).primaryColor,
                  bgColor: Theme.of(context).accentColor,
                  onpressed: () => finish(),
              )
              // child: ,
            )
          ],
        ),
      ),
    );
  }
}