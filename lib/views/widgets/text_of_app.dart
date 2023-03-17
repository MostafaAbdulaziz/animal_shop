import 'package:flutter/material.dart';

class TextOfApp extends StatelessWidget {
  final String text;
  final Color color;
  final double font;

  const TextOfApp(
      {Key? key, required this.text, this.color = Colors.black, this.font = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: font,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
