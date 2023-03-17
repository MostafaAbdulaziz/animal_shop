import 'package:flutter/material.dart';
class IconButtonOfApp extends StatelessWidget {
  final IconData?  icon;
  final Function() function;
  final double? size;
  final Color color;
  const IconButtonOfApp({Key? key,required this.function,required this.icon,this.size,this.color=Colors.black}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(icon,color: Colors.black,),onPressed: function,iconSize: size,);
  }
}
