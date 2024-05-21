import 'package:flutter/material.dart';

void displayMessage(String msg,BuildContext context){
  showDialog(context: context, builder: (context)=> AlertDialog(
    title: Text(msg),
  ));
}