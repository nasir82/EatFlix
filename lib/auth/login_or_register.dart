import 'package:flutter/material.dart';
import 'package:play/pages/login_page.dart';
import 'package:play/pages/register_page.dart';

class LogInOrRegister extends StatefulWidget {
  const LogInOrRegister({super.key});

  @override
  State<LogInOrRegister> createState() => _LogInOrRegisterState();
}

class _LogInOrRegisterState extends State<LogInOrRegister> {

  bool showLogin = true;

  void togglePages() {
    setState(() {
      showLogin = !showLogin;

    });
  }
  @override
  Widget build(BuildContext context) {
     if(showLogin){
      print("loging");
      return LoginPage(onTap: togglePages,);
    }else{
      return Register(onTap: togglePages,);
    }
    
  }
}