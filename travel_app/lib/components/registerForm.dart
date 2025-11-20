import 'package:flutter/material.dart';
import 'package:travel_app/components/button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

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
              )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(28, 161, 255, 1),
              )),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.red,
              )),
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
              )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(28, 161, 255, 1),
              )),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.red,
              )),
            ),
          ),
          const SizedBox(height: 15),   
          TextFormField(
            controller: _confirmPassController,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              labelText: 'Confirm Password',
              alignLabelWithHint: true,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.lock_outline),
              prefixIconColor: Colors.blue,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: const Color.fromRGBO(28, 161, 255, 1),
              )),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(28, 161, 255, 1),
              )),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.red,
              )),
            ),
          ),
          const SizedBox(height: 20),   
          Button(
            title: 'Register', 
            disable: false, 
            onPressed: () {}
          ),
        ],
      ),
    );
  }
}