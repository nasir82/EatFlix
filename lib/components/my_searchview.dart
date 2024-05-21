import 'package:flutter/material.dart';
class MySearchView extends StatefulWidget {
  const MySearchView({super.key});

  @override
  State<MySearchView> createState() => _MySearchViewState();
}

class _MySearchViewState extends State<MySearchView> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.only(bottom: 40,right: 10,left: 10),
      child: TextField(
        
        decoration: InputDecoration(
          filled: false,
          focusColor: Colors.grey[300],
          fillColor: Theme.of(context).colorScheme.primary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
           
          ),
          labelText: "What do you want?",
          hintStyle: TextStyle(
            fontSize: 20,
    
          ),
         
          prefixIcon: Icon(Icons.search,color: Theme.of(context).colorScheme.inversePrimary,),
          prefixIconColor: Theme.of(context).colorScheme.primary,
        ),
       style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold
       ), 
      ),
    );
  }
}