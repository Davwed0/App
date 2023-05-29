import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const InputTextField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: EdgeInsets.all(6),
      child: TextField(
        controller: controller,
        obscureText: false,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
