import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.wantDecoration,
    this.decorationColor,
  });

  final String text;
  final Color color;
  final double fontSize;
  final Color? decorationColor;
  final bool wantDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          decoration:
              wantDecoration ? TextDecoration.underline : TextDecoration.none,
          decorationColor: decorationColor),
    );
  }
}
