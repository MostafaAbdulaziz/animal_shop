import 'package:animalsshop/views/widgets/text_of_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioListTileButton extends StatefulWidget {
  final String value;
  final String groupValue;
  final String text;

  const RadioListTileButton(
      {super.key, required this.groupValue, required this.value,required this.text});

  @override
  State<StatefulWidget> createState() =>
      RadioButtonTwo(groupValue: groupValue, value: value,text: text);
}

class RadioButtonTwo extends State<RadioListTileButton> {
  late final String value;
  String groupValue;
  late final String text;

  RadioButtonTwo({
    required this.value,
    required this.groupValue,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          setState(() {
            groupValue = value!;
          });
        },
      title: TextOfApp(text: text,),
      activeColor: Colors.white,
    );
  }
}
