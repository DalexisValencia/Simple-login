import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final Color color;
  final String hintText;
  final FocusNode textFocus;
  final TextEditingController textController;
  final String helperText;
  final bool obscureText;
  final Function submit; 
  final TextInputAction inputAction;

  TextFieldCustom({
    this.color,
    this.hintText,
    this.textFocus,
    this.textController,
    this.helperText,
    this.obscureText,
    this.submit,
    this.inputAction
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: inputAction,
      obscureText: obscureText,
      focusNode: textFocus,
      onFieldSubmitted: (val) => submit(),
      controller: textController,
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helperText,
        helperStyle: TextStyle(
          color: color,
          fontStyle: FontStyle.italic
        ),
        hintStyle: TextStyle(
          color: color,
          fontWeight: FontWeight.w500
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: color
          )
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: color
          )
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: color
          )
        )
      ),
    );
  }
}