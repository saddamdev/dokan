import 'package:dokan/services/api_service.dart';
import 'package:flutter/material.dart';
import '../widgets/screen_text.dart';
import '../widgets/dokan_text_field.dart';
import '../widgets/form_submit_button.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  Color messageColor = Colors.green;
  String message = '';
  String name = 'Your Name';

  String checkName(val) {
    if (val.length < 4) {
      return 'Name should be at least 4 characters';
    } else {
      return null;
    }
  }

  void setFirstName(val) => setState(() => firstName = val);

  void setLastName(val) => setState(() => lastName = val);

  void submitForm() async {
    final isValid = formKey.currentState.validate();
    if (isValid) {
      setState(() {
        messageColor = Colors.green;
        message = 'Request in progress...';
      });
      formKey.currentState.save();
      String fullName = await updateUser(firstName, lastName);
      setState(() => name = fullName);
      setState(() => message = '');
    } else {
      setState(() {
        messageColor = Colors.amber;
        message = 'Something went wrong!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
        reverse: true,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.person, size: 96),
              SizedBox(height: 8),
              ScreenText(text: name),
              SizedBox(height: 40),
              DokanTextField(
                hint: 'First Name',
                hintIcon: Icons.edit_outlined,
                checkValidation: checkName,
                setValue: setFirstName,
              ),
              SizedBox(height: 24),
              DokanTextField(
                hint: 'Last Name',
                hintIcon: Icons.edit_outlined,
                checkValidation: checkName,
                setValue: setLastName,
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
                buttonColor: Color(0xFF1ABC9C),
                buttonText: 'Update',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
