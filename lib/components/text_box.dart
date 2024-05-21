import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String hintText;
  final double siz;
  const TextBox({super.key,required this.hintText,required this.siz});

  @override
  Widget build(BuildContext context) {
    final txtyle = TextStyle(
      color: Colors.lightBlue.shade200,
      fontWeight: FontWeight.bold,
      fontSize: 18
    );
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width * .8 * siz,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.inversePrimary,
          
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
               hintText,
              style:txtyle,      
            ),
        ),
      ),
    );
  }
}