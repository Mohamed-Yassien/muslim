import 'package:flutter/material.dart';
import 'package:muslin/app/presentation/components/to_arabic_converter.dart';
import 'package:muslin/core/constants.dart';

class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({Key? key, required this.i}) : super(key: key);
  final int i;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\uFD3F${(i + 1).toString().toArabicNumbers}\uFD3E",
      style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 18,
          shadows: [
            Shadow(
              offset: Offset(.5, .5),
              blurRadius: 1.0,
              color: AppConstance.primaryColor,
            ),
          ]),
    );
  }
}
