import 'package:play/auth/auth_gate.dart';
import 'package:play/auth/auth_services.dart';
import 'package:play/pages/my_content.dart';
import 'package:play/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:play/components/drawer_tile.dart';
import 'package:play/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
              text: "Home",
              icon: Icons.home,
              onTap: () => Navigator.pop(context)),
           MyDrawerTile(
              text: "Profile",
              icon: Icons.person_2_rounded, 
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfilePage()));
              }),

           MyDrawerTile(
              text: "Subcription",
              icon: Icons.subscriptions,
              onTap: () => Navigator.pop(context)),
           MyDrawerTile(
              text: "My contents",
              icon: Icons.content_copy_sharp,
              onTap: (){
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const MyContent()));
              }),
          MyDrawerTile(text: "Settings", 
          icon: Icons.settings,
           onTap: (){
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const MySettings()));
           }),
          MyDrawerTile(text: "L O G O U T", icon: Icons.logout, onTap: () async{

            final _authService = AuthServices();
            await _authService.signOut();
            Navigator.pop(context);
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> AuthGate()) );

          }),
        ],
      ),
    );
  }
}
