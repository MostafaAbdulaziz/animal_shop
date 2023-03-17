import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:flutter/material.dart';

class TextButtonApp extends StatelessWidget {
  final Function() function;
  final String text;

  const TextButtonApp({Key? key, required this.function, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: TextOfApp(text: text, color: Colors.blue, font: 15),
    );
  }
}
