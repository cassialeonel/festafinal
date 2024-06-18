import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {
  String texto;
  void Function() onPressed;
  Buttons(this.texto, {required this.onPressed});
  @override




  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(this.texto));
  }
}
