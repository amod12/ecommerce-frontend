import 'package:flutter/material.dart';
import 'customTextField.dart';
import 'customButton.dart';
import 'authService.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'reg';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void register() {
    authService.registerService(
      email: _emailController.text,
      context: context,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: Form(
          key: _signUpFormKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _nameController,
                hintText: 'Name',
              ),
              SizedBox(
                height: 10.0,
              ),
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
              TextFormField(
                  controller: _confirmPass,
                  decoration: InputDecoration(
                    fillColor: Colors.white12,
                    hintText: 'confirm password',
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Enter correct password';
                    }
                    if (val != _passwordController.text) {
                      return 'Not Match';
                    }
                    return null;
                  }),
              SizedBox(
                height: 10.0,
              ),
              CustomButton(
                  text: 'SignUp',
                  onPressed: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      register();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
