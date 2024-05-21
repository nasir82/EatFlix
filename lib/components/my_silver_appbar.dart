import 'package:play/models/model_menu.dart';
import 'package:flutter/material.dart';

class MySilverAppbar extends StatefulWidget {
  final Widget child;
  final Widget title;
  final TabController controller;

  MySilverAppbar({Key? key, required this.controller, required this.child,required this.title});

  @override
  State<MySilverAppbar> createState() => _MySilverAppbarState();
}

class _MySilverAppbarState extends State<MySilverAppbar> {
  ModelMenu modelMenu = ModelMenu();

  @override
  Widget build(BuildContext context) {
    
        return SliverAppBar(
          
          backgroundColor: Theme.of(context).colorScheme.background,
          title:  Text("EatFlix",style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.w800
          ),),
         flexibleSpace: FlexibleSpaceBar(
        background: widget.title,
        title: widget.child,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      ),  
          centerTitle: true,
          floating: false,
          pinned: true,
          expandedHeight: 380,
          collapsedHeight: 120,
          
         
        
        );
      
  }
}
