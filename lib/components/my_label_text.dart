import 'package:flutter/material.dart';

class MyTextFieldWithLabel extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;

  const MyTextFieldWithLabel({super.key,required this.controller,required this.hintText,required this.isObscure});

  @override
  Widget build(BuildContext context) {
    final txtyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
      fontWeight: FontWeight.bold,
      fontSize: 18
    );
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            )
          ),
          labelText: hintText,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
          ),
          
        ),
      style: txtyle,
      ),
    );
  }
}