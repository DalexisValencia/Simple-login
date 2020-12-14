import 'package:flutter/material.dart';
import 'package:third_test_app/Screens/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'login demo app',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            accentColor: Color(0xFFffffff), // Blanco
            primaryColor: Color(0xFFd73ca1), //morado
            primaryColorLight: Color(0xFFe55fdf), //morado claro
            primaryColorDark: Color(0xFFa93674), //morado oscuro
            hoverColor: Color(0xFFffb44a) // Naranja
            ),
        home: WelcomeScaffold()
        // home: LoginScaffold()
        // home: RegisterScaffold()
        );
  }
}
