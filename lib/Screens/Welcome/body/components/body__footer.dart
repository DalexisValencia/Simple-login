import 'package:flutter/material.dart';
import 'package:third_test_app/Screens/Login/login.dart';
import 'package:third_test_app/Screens/Register/register.dart';

class WelcomeFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.73,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: RaisedButton(
                splashColor: Theme.of(context).hoverColor,
                color: Theme.of(context).accentColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 22,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    createPage(
                      LoginScaffold(
                        animtedOpacityProp: false,
                      ),
                    ),
                  );
                },
                child: Text(
                  "SIGN UP",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColorDark,
                      ),
                ),
              ),
            ),
          ),
          Text(
            'Have an account yet',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          GestureDetector(
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).accentColor,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(
                createPage(
                  RegisterScaffold(
                    animatedOpacityProp: false,
                  ),
                ),
              )
                  .then((_) {
                print("regresado");
              });
            },
          )
        ],
      ),
    );
  }
}

Route createPage(children) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation animation,
            Animation animationSecondary) =>
        children,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //return child;
      return SlideTransition(
        position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
    },
  );
}
