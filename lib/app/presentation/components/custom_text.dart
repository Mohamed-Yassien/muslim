import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
     this.fontSize = 18,
     this.textColor = Colors.black,
     this.fontWeight = FontWeight.w500,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,

      ),
    );
  }
}
