import 'package:flutter/material.dart';
import 'package:bookbridge/res/colors.dart';

class LoginRegisTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController valueController;
  final Function() onChanged;

  const LoginRegisTextField(
      {Key? key,
      required this.hintText,
      required this.valueController,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: valueController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 17,
            color: lightgrey,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0.0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onChanged: (value) {
          onChanged();
        },
      ),
    );
  }
}
