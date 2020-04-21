import 'package:flutter/material.dart';
import 'package:third_test_app/pages/login.dart';
import 'package:third_test_app/pages/register.dart';

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

class _WelcomePageState extends State<WelcomePage> with WidgetsBindingObserver{
  bool animatedOpacity = false;

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

  @override
  void initState(){
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    print(animatedOpacity);
    setState(() {
      animatedOpacity = true;
    });
    print("en el inir");
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
   // exampleAnimation(true); 
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
          stops: [
            0.2,
            0.9
          ]
        )
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.20),
            height: MediaQuery.of(context).size.height*0.73,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0x0000000),
                width:1
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnimatedOpacity(
                  opacity: animatedOpacity ? 1.0 : 0.0,
                  duration: Duration(
                    milliseconds: 3000
                  ),
                  child: Header(),
                ),
                AnimatedOpacity(
                  opacity: 1,
                  duration: Duration(
                    milliseconds: 3000
                  ),
                  child: Footer()
                )
                
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*0.60,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child:  Text(
                "WELCOME",
                style: Theme.of(context).textTheme.display1.copyWith(
                  fontWeight:FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                  fontFamily: 'Litia',
                ),
              ),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -7, 0),
            width: MediaQuery.of(context).size.width*0.32,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child:Text(
                'ON BOARD',
                style: Theme.of(context).textTheme.title.copyWith(
                  fontWeight:FontWeight.w300,
                  color: Theme.of(context).accentColor
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width*0.09,
              bottom: MediaQuery.of(context).size.width*0.04
            ),
            width: MediaQuery.of(context).size.width*0.55,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet, ddd",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body1.copyWith( 
                color: Theme.of(context).accentColor,
                fontSize: 14,
                fontWeight: FontWeight.w300
              ),
            ),
          )
        ],
      ),
    );
  }
}


class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width *0.73,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: RaisedButton(
                splashColor: Theme.of(context).hoverColor,
                color: Theme.of(context).accentColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
                ),
                padding: EdgeInsets.only(top:22, bottom:22),
                onPressed: (){
                  Navigator.of(context).push(createPage(LoginScaffold()));
                },
                child: Text(
                  "SIGN UP",
                  style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColorDark
                  ),
                ),
              )
            )
          ),
          Text(
            'Have an account yet',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor
            ),
          ),
          GestureDetector(
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                color:Theme.of(context).accentColor,
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).accentColor
              ),
            ),
            onTap: (){
              Navigator.of(context).push(createPage(RegisterScaffold()));
            },
          )
          
        ],
      )
    );
  }
}

Route createPage(children) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation animation, Animation animationSecondary) => children,
    transitionsBuilder: (context, animation, secondaryAnimation, child){
     //return child;
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1,0),
          end: Offset.zero
        ).animate(animation),
        child: child,
      );
    }
  );
}