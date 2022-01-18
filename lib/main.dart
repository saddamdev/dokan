import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dokan',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFFF8F8F8),
        scaffoldBackgroundColor: Color(0xFFF8F8F8),
        appBarTheme: AppBarTheme(elevation: 0, centerTitle: true),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => LoginScreen(),
        '/registration': (_) => RegistrationScreen(),
        '/home': (_) => HomeScreen(),
      },
    );
  }
}
