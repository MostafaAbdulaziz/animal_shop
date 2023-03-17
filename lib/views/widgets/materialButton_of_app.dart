import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:flutter/material.dart';

class ButtonOfApp extends StatelessWidget {
  final Function() function;
  final double width;
  final String text;

  const ButtonOfApp(
      {Key? key,
      required this.function,
      this.width = double.infinity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
      minWidth: width,
      height: 50,
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextOfApp(text: text, font: 20),
    );
  }
}
