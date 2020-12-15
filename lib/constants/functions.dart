import 'package:flutter/material.dart';

Future<void> showMyDialog(BuildContext context, List<Widget> summary) async {
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
