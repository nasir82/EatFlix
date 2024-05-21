import 'package:play/models/service_models.dart';
import 'package:flutter/material.dart';


class MyTapbarr extends StatelessWidget {
  final TabController controller;
  const MyTapbarr({super.key, required this.controller});

  // make list of tab

 List<Tab> _buildCatagortTab(){
    return CatagortClass.values.map((catagory) {

      return Tab(
        text: catagory.toString().split('.').last,);

    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    //double totalWidth = MediaQuery.of(context).size.width * FoodCatagory.values.length;
    return DefaultTabController(
      length: 3,
      
      child: TabBar(
        controller: controller,
        isScrollable: false, // Make TabBar scrollable
        tabs: _buildCatagortTab(),
        labelColor: Theme.of(context).colorScheme.inversePrimary,
        indicatorColor:Theme.of(context).colorScheme.secondary ,
      ),
    );
  }
}
