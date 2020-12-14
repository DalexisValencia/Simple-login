import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.60,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "WELCOME",
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark,
                      fontFamily: 'Litia',
                    ),
              ),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -7, 0),
            width: MediaQuery.of(context).size.width * 0.32,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'ON BOARD',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).accentColor,
                    ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.09,
              bottom: MediaQuery.of(context).size.width * 0.04,
            ),
            width: MediaQuery.of(context).size.width * 0.55,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, Lorem ipsum dolor sit amet elir cosnte",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Theme.of(context).accentColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
