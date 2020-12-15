import 'package:flutter/material.dart';

class RichTextSummary extends StatelessWidget {
  final String name;
  final String value;
  RichTextSummary({
    this.name,
    this.value,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$name: ',
        style: Theme.of(context).textTheme.button.copyWith(
              fontWeight: FontWeight.bold,
            ),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
