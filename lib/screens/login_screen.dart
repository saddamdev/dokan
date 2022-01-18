import 'package:flutter/material.dart';
import '../widgets/dokan_text.dart';
import '../widgets/screen_text.dart';
import '../widgets/dokan_text_field.dart';
import '../widgets/dokan_pass_field.dart';
import '../widgets/form_submit_button.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
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

  String checkPass(val) {
    if (val.length < 6) {
      return 'Password should be at least 6 characters';
    } else {
      return null;
    }
  }

  void setPass(val) => setState(() => password = val);

  void passVisibility() => setState(() => isPassVisible = !isPassVisible);

  void submitForm() async {
    final isValid = formKey.currentState.validate();
    if (isValid) {
      setState(() {
        messageColor = Colors.green;
        message = 'Login in progress...';
      });
      formKey.currentState.save();
      int loginCode = await loginUser(username, password);
      if (loginCode == 200) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          messageColor = Colors.amber;
          message = 'Something went wrong. Status Code: $loginCode';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                ScreenText(text: 'Sign In'),
                SizedBox(height: 40),
                DokanTextField(
                  hint: 'Name',
                  hintIcon: Icons.person_outline_rounded,
                  checkValidation: checkName,
                  setValue: setName,
                ),
                SizedBox(height: 24),
                DokanPassField(
                  hint: 'Password',
                  isVisible: isPassVisible,
                  changeVisibility: passVisibility,
                  checkValidation: checkPass,
                  setValue: setPass,
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
                    buttonText: 'Login'),
                SizedBox(height: 40),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registration');
                  },
                  child: Text(
                    'Create New Account',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
