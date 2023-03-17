
class TextFormFieldApp extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final TextEditingController textFormFieldController;
  final String? textVerified;
  final double? font;
  final bool obscureText;
  final Function? onChange;

  const TextFormFieldApp(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon,
      required this.textInputType,
      required this.textFormFieldController,
      this.textVerified,
      this.font = 18,
      this.obscureText=false,
        this.onChange
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: textInputType,
      controller: textFormFieldController,
      style: TextStyle(
        fontSize: font,
        fontWeight: FontWeight.bold,
      ),
      validator: (value) {
        if(value!.isEmpty)
          return textVerified;
        return null;
      },
      obscureText: obscureText,
      onChanged: (String? value)=>onChange!(value),
    );
  }
}
