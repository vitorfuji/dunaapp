import 'package:dunaapp/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController textEditingController;

  const InputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        cursorColor: Colors.white,
        obscureText: true,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          prefixIcon: Icon(
            icon,
            color: const Color.fromARGB(255, 185, 156, 67),
            size: 25,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
