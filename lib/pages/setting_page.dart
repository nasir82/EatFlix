import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
              color: Theme.of(context).colorScheme.inversePrimary),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
             const Text("Dark mode ",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400
          
             ),),
            const Spacer(),
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: true)
                      .isDarkMode,
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
