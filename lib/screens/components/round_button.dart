import 'package:flutter/material.dart';

import 'button_widget.dart';
class RoundedButton extends StatelessWidget {
  final Color color;
  final String title;
  VoidCallback onPressed;

  RoundedButton({this.color, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: ButtonWidget(title, onPressed),
      ),
    );
  }
}