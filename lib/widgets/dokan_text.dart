import 'package:flutter/material.dart';

class DokanText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: 'D',
            style: TextStyle(
              color: Color(0xFFF1634C),
            ),
          ),
          TextSpan(
            text: 'okan',
            style: TextStyle(
              color: Color(0xFF4D4D4F),
            ),
          )
        ],
      ),
    );
  }
}
