
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:play/colors/colors.dart';

class IconCustom extends StatefulWidget {
  final IconData icon;
  final double size;
  final String info;
  final Function? onTap;
  const IconCustom({super.key,required this.icon,required this.size,required this.info,required this.onTap });
  

  @override
  State<IconCustom> createState() => _IconCustomState();
}

class _IconCustomState extends State<IconCustom> {
  @override
  Widget build(BuildContext context) {
    double width  =  MediaQuery.of(context).size.width;
    return  Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => widget.onTap!(),
        child: Container(
          height: 65,
          width: width*.8/3,
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.shadow
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(widget.icon,size: widget.size,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(widget.info))
              ],
            ),
          ),
        ),
      ),
    );
  }
}