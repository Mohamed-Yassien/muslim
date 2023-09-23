import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
     this.fontSize = 18,
     this.textColor = Colors.black,
     this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
