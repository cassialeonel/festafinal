import 'package:flutter/material.dart';
class Input extends StatelessWidget {
  TextEditingController controller;
  final String hintText;
  Input(this.controller, this.hintText);
  //construtor com parametro
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
        decoration: InputDecoration(
        hintText: hintText,
    ));
  }
}
