import 'package:play/auth/auth_services.dart';
import 'package:play/colors/constant.dart';
import 'package:play/components/login_txt.dart';
import 'package:play/helper/dialog.dart';
import 'package:flutter/material.dart';
import 'package:play/components/my_button.dart';
import 'package:play/pages/home_page2.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmController = TextEditingController();

  void registerUser() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      displayMessage("Please fill the information", context);
    } else if (passwordController.text != confirmController.text) {
      displayMessage("Password not match", context);
    } else {
      final _authService = AuthServices();
      try {
        final res = await _authService.signUp(
            emailController.text, passwordController.text);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomePage2()));
        print("register");
      } catch (e) {
        displayMessage(e.toString(), context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    String backgroundImage = brightness == Brightness.dark
        ? Constants.darkImag
        : Constants.lightImag;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
        backgroundImage,
      ),
      fit: BoxFit.fill
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

             Icon(
                  Icons.lock_open,
                  size: 180,
                  color: Theme.of(context).colorScheme.primary,
                ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Registar Here",style: TextStyle(
                  fontSize: 34,
                  color: Colors.green.shade400,
                  fontWeight: FontWeight.bold
                ),),
                  ],
                ),
               
                const SizedBox(height: 10),
                LoginText(
                    controller: emailController,
                    hintText: "Email",
                    isObscure: false,
                    icon: Icons.email,),
                const SizedBox(height: 10),
                LoginText(
                    controller: passwordController,
                    hintText: "Password",
                    isObscure: true,
                    icon: Icons.visibility_off,),
                const SizedBox(height: 10),
                LoginText(
                    controller: confirmController,
                    hintText: "Confirm Password",
                    isObscure: true,
                    icon: Icons.visibility_off,),
                const SizedBox(height: 10),
                MyButton(
                  onTap: () {
                    // Add your registration logic here
                    registerUser();
                  },
                  text: "Register",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child:const Text(
                        " Login Now",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
