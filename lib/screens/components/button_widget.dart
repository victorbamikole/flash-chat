import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  final String title;
  VoidCallback onPressed;

  ButtonWidget(this.title, this.onPressed);

  void navigate(BuildContext context, String screen) {
    Navigator.pushNamed(context, screen);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 200.0,
      height: 42.0,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}