import 'package:flutter/material.dart';

class MyTabRow extends StatefulWidget {
  const MyTabRow({Key? key});

  @override
  State<MyTabRow> createState() => _MyTabRowState();
}

class _MyTabRowState extends State<MyTabRow> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      fontSize: 16,
      color: Theme.of(context).colorScheme.onSurface,
    );
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text("Bar", style: style),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
            
            ),
            child: Text("Cafe", style: style),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              
            ),
            child: Text("Restaurant", style: style),
          ),
        ],
      ),
    );
  }
}
