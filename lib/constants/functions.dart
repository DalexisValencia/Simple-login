import 'package:flutter/material.dart';

Future<void> showMyDialog(BuildContext context, List<Widget> summary) async {
  FocusScope.of(context).requestFocus(new FocusNode());
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Summary',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: summary,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Approve',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

showSnackBar(BuildContext context, String alert, String type) {
  final snackBar = SnackBar(
    backgroundColor: type == 'error'
        ? Theme.of(context).primaryColor
        : Theme.of(context).hoverColor,
    content: Text(
      alert,
      style: Theme.of(context).textTheme.button.copyWith(
            color: Theme.of(context).accentColor,
          ),
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
