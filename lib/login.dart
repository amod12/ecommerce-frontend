import 'package:flutter/material.dart';
import 'customTextField.dart';
import 'customButton.dart';
import 'authService.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() {
    authService.signInUser(
      email: _emailController.text,
      context: context,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: Form(
          key: _signInFormKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _emailController,
                hintText: 'E-mail',
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: 'password',
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomButton(
                  text: 'SignIn',
                  onPressed: () {
                    if (_signInFormKey.currentState!.validate()) {
                      signInUser();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
