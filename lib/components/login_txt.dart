import 'package:flutter/material.dart';
import 'package:play/colors/colors.dart';

class LoginText extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  final IconData icon;

  const LoginText({super.key,required this.controller,required this.hintText,required this.isObscure,required this.icon});

  @override
  State<LoginText> createState() => _LoginTextState();
}

class _LoginTextState extends State<LoginText> {

  
  @override
  Widget build(BuildContext context) {
  
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        
        controller: widget.controller,
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: (){
            
            },
            child: Icon(widget.icon)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.borderColor,
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.borderFocus,
            )
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
          ),
          
        ),
      style: MyColors.textStyle,
      
      ),
    );
  }
}