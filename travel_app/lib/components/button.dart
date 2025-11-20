import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.title, required this.disable, required this.onPressed});
  
  final String title;
  final bool disable;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: disable ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(28, 161, 255, 1),
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          )
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        )
      ),
    );
  }
}