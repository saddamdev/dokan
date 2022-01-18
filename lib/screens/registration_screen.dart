import 'package:flutter/material.dart';
import '../widgets/dokan_text.dart';
import '../widgets/screen_text.dart';
import '../widgets/dokan_text_field.dart';
import '../widgets/dokan_pass_field.dart';
import '../widgets/form_submit_button.dart';
import '../services/api_service.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  bool isPassVisible = true;
  Color messageColor = Colors.green;
  String message = '';

  String checkName(val) {
    if (val.length < 4) {
      return 'Name should be at least 4 characters';
    } else {
      return null;
    }
  }

  void setName(val) => setState(() => username = val);

  String checkEmail(val) {
    final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);

    if (val.isEmpty) {
      return 'Enter an email';
    } else if (!regExp.hasMatch(val)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  void setEmail(val) => setState(() => email = val);

  String checkPass(val) {
    if (val.length < 6) {
      return 'Password should be at least 6 characters';
    } else if (val != confirmpassword) {
      return 'Password has not matched';
    } else {
      return null;
    }
  }

  void setPass(val) => setState(() => password = val);

  String checkConfirmPass(val) {
    if (val.length < 6) {
      return 'Password should be at least 6 characters';
    } else if (val != password) {
      return 'Password has not matched';
    } else {
      return null;
    }
  }

  void setConfirmPass(val) => setState(() => confirmpassword = val);

  void passVisibility() => setState(() => isPassVisible = !isPassVisible);

  void submitForm() async {
    final isValid = formKey.currentState.validate();
    if (isValid) {
      setState(() {
        messageColor = Colors.green;
        message = 'Registratioin in progress...';
      });
      formKey.currentState.save();
      int regCode = await registerUser(username, email, password);
      if (regCode == 200) {
        Navigator.pushReplacementNamed(context, '/');
      } else {
        setState(() {
          messageColor = Colors.amber;
          message = 'Something went wrong. Status Code: $regCode';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 0),
        reverse: true,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DokanText(),
              SizedBox(height: 24),
              ScreenText(text: 'Sign Up'),
              SizedBox(height: 40),
              DokanTextField(
                hint: 'Name',
                hintIcon: Icons.person_outline_rounded,
                checkValidation: checkName,
                setValue: setName,
              ),
              SizedBox(height: 24),
              DokanTextField(
                hint: 'Email',
                hintIcon: Icons.mail_outline_rounded,
                checkValidation: checkEmail,
                setValue: setEmail,
              ),
              SizedBox(height: 24),
              DokanPassField(
                hint: 'Password',
                isVisible: isPassVisible,
                changeVisibility: passVisibility,
                checkValidation: checkPass,
                setValue: setPass,
              ),
              SizedBox(height: 24),
              DokanPassField(
                hint: 'Confirm Password',
                isVisible: isPassVisible,
                changeVisibility: passVisibility,
                checkValidation: checkConfirmPass,
                setValue: setConfirmPass,
              ),
              SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: messageColor),
              ),
              SizedBox(height: 8),
              FormSubmitButton(
                onSubmit: submitForm,
                buttonColor: Color(0xFFF75F55),
                buttonText: 'Sign Up',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
