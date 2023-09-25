import 'package:flutter/material.dart';
import 'package:muslin/core/constants.dart';

import 'custom_text.dart';

class LoadingAndError extends StatelessWidget {
  const LoadingAndError(
      {Key? key,
      required this.isError,
      required this.isLoading,
      required this.child})
      : super(key: key);
  final bool isError;
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (isError) {
        return const Material(
          child: Center(
              child: CustomText(
            text: 'حدث خطا ما',
            fontSize: 18.0,
            textColor: AppConstance.primaryColor,
          )),
        );
      } else if (isLoading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else {
        return child;
      }
    });
  }
}
