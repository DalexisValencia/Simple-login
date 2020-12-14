import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:third_test_app/widgets/form__button.dart';
import 'package:third_test_app/widgets/form__input.dart';

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
    emailController = TextEditingController();
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
        left: MediaQuery.of(context).size.width * 0.15,
        right: MediaQuery.of(context).size.width * 0.15,
      ),
      margin: EdgeInsets.only(
        bottom: keyBoardState == true
            ? 0
            : MediaQuery.of(context).size.height * 0.17,
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
                  top: MediaQuery.of(context).size.height * 0.10,
                ),
                width: MediaQuery.of(context).size.width * 0.73,
                child: FormButton(
                  child: Text(
                    "SIGN UP",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
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
