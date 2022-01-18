import 'package:flutter/material.dart';

class DokanTextField extends StatelessWidget {
  DokanTextField({
    @required this.hint,
    @required this.hintIcon,
    @required this.checkValidation,
    @required this.setValue,
  });
  final String hint;
  final IconData hintIcon;
  final Function checkValidation;
  final Function setValue;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(24),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 24),
          prefixIcon: Icon(
            hintIcon,
            size: 32,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 24),
        validator: checkValidation,
        onSaved: setValue,
      ),
    );
  }
}
