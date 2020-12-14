import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:third_test_app/widgets/form__button.dart';
import 'package:third_test_app/widgets/form__input.dart';

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
    FocusScope.of(context).requestFocus(
      new FocusNode(),
    );
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
      width: MediaQuery.of(context).size.width, //  *0.73
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.15,
        right: MediaQuery.of(context).size.width * 0.15,
      ),
      margin: EdgeInsets.only(
        bottom: keyBoardState == true
            ? 0
            : MediaQuery.of(context).size.height * 0.13,
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
                top: MediaQuery.of(context).size.width * 0.10,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).hoverColor
                  ],
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              width: MediaQuery.of(context).size.width * 0.73,
              child: FormButton(
                child: Text(
                  "LOG IN",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).accentColor,
                      ),
                ),
                splashColor: Theme.of(context).accentColor,
                bgColor: Color(0x000000),
                onpressed: () => finish(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
