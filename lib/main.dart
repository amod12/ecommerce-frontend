import 'package:flutter/material.dart';
import 'welcome.dart';
import 'login.dart';
import 'reg.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Home.id: (context) => Home(),
      },
      initialRoute: WelcomeScreen.id,
    );
  }
}
