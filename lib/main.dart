import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:play/auth/auth_gate.dart';
import 'package:play/firebase_options.dart';
import 'package:play/models/model_menu.dart';
import 'package:play/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
     MultiProvider(providers:
    [

        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ModelMenu()),
    ],
    child: const MyApp(),
    ),
    
  );
    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  Provider.of<ThemeProvider>(context).themeData,
      home:const AuthGate(),
    );
  }
}