import 'package:flutter/material.dart';

class DokanPassField extends StatelessWidget {
  DokanPassField({
    @required this.hint,
    @required this.isVisible,
    @required this.changeVisibility,
    @required this.checkValidation,
    @required this.setValue,
  });
  final String hint;
  final bool isVisible;
  final Function changeVisibility;
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
            Icons.lock_outline_rounded,
            size: 32,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            icon:
                isVisible ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            onPressed: changeVisibility,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24),
        obscureText: isVisible,
        validator: checkValidation,
        onChanged: setValue,
        onSaved: setValue,
      ),
    );
  }
}
