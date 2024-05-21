import 'package:play/auth/auth_services.dart';
import 'package:play/colors/constant.dart';
import 'package:play/components/login_txt.dart';
import 'package:play/helper/dialog.dart';
import 'package:flutter/material.dart';
import 'package:play/components/my_button.dart';
import 'package:play/components/text_field.dart';
import 'package:play/pages/home_page2.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailControler = TextEditingController();

  final TextEditingController passControler = TextEditingController();

  // methods related to this pages will be here
  void login() async {
    //verify the credencial
    final _authService = AuthServices();
    try {
      await _authService.signIn(emailControler.text, passControler.text);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomePage2()));
    } catch (e) {
      displayMessage(e.toString(), context);
    }
    // then navigate or show errors
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
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.lock_open,
                size: 180,
                color: Theme.of(context).colorScheme.primary,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 34,
                        color: Colors.green.shade400,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              LoginText(
                controller: emailControler,
                hintText: "Email",
                isObscure: false,
                icon: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginText(
                controller: passControler,
                hintText: "Password",
                isObscure: true,
                icon: Icons.visibility_off,
              ),
              const SizedBox(
                height: 10,
              ),
              MyButton(
                  onTap: () {
                    login();
                  },
                  text: "login"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not yet SignUp?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                      )),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "  Register Now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
