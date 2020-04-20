import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final Widget child;
  final Color splashColor;
  final Color bgColor;
  final Function onpressed; 

  WidgetButton({this.child, this.splashColor, this.bgColor, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      splashColor: splashColor,
      color: bgColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40)
      ),
      padding: EdgeInsets.only(
        top:22,
        bottom:22
      ),
      onPressed: onpressed,
      child: child,
      // child: Text(
      //   label,
      //   style: Theme.of(context).textTheme.body1.copyWith(
      //     fontSize: 18,
      //     fontWeight: FontWeight.w400,
      //     color: Theme.of(context).primaryColorDark
      //   ),
      // ),
    );
  }
}