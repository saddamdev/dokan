import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  FormSubmitButton({
    this.onSubmit,
    @required this.buttonColor,
    @required this.buttonText,
  });
  final Function onSubmit;
  final Color buttonColor;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onSubmit,
      textColor: Colors.white,
      color: buttonColor,
      padding: EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
