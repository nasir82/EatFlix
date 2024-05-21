import 'package:flutter/material.dart';

class LinkedComponent extends StatefulWidget {
  final IconData icon;
  final String txt;
  const LinkedComponent({super.key, required this.icon, required this.txt});

  @override
  State<LinkedComponent> createState() => _LinkedComponentState();
}

class _LinkedComponentState extends State<LinkedComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(10),
      height: 80,
      width: 120,
      color: Theme.of(context).colorScheme.background,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary)),
      child: Column(children: [Icon(Icons.phone,size: 40,), Text(widget.txt)]),
    );
  }
}
