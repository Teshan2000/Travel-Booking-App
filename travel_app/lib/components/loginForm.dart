import 'package:flutter/material.dart';
import 'package:travel_app/components/button.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/services/authService.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authservice = AuthService();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void login() async {
    final result = await _authservice.login(
      _emailController.text,
      _passController.text,
    );

    if (result.containsKey('accessToken')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful!")));
        
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home(
          accessToken: result['accessToken'],
          refreshToken: result['refreshToken'],))
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email Address',
              alignLabelWithHint: true,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Colors.blue,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(28, 161, 255, 1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _passController,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.lock_outline),
              prefixIconColor: Colors.blue,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(28, 161, 255, 1),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Button(
            title: 'Login',
            disable: false,
            onPressed: () {
              login();
            },
          ),
        ],
      ),
    );
  }
}
