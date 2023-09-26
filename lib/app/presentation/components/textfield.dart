import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslin/core/constants.dart';


GestureTapCallback gestureTapCallback(controller) {
  return () {
    if (controller != null) {
      if (controller.value.text.length > 0) {
        controller.selection = TextSelection(
            baseOffset: 0, extentOffset: controller.value.text.length);
      }
    }
  };
}

// ignore: must_be_immutable
class DefaultTextField extends StatefulWidget {
  DefaultTextField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.border,
    this.minlines,
    this.maxlines,
    this.onChange,
    this.validate,
    this.focusNode,
    this.inputFormatter = const [],
    this.contentPadding,
    this.readOnly = false,
    this.enable,
    this.prefixIcon,
    this.onTap,
    this.maxlength,
    this.borderColor = Colors.white,
    this.fillColor = Colors.white,
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.suffixIconColor = Colors.white,
    this.underlineInputBorder = Colors.white,
    this.isFill = false,
    this.onSumbit,
    this.hintSize = 14,
    this.radius = 30,
    this.textSize = 16.0,
  }) : super(key: key);
  bool? enable;
  bool readOnly;
  TextInputType? keyboardType;
  Widget? suffixIcon;
  TextEditingController? controller;
  String? label;
  final double radius;
  String? hintText;
  Color? fillColor;
  bool? isFill;
  double? hintSize;
  Color? borderColor;
  String? Function(String?)? validate;
  Function()? onTap;
  FocusNode? focusNode;
  List<TextInputFormatter> inputFormatter;
  InputBorder? border;
  int? minlines;
  int? maxlength;
  Widget? prefixIcon;
  int? maxlines;
  Color? textColor;
  double? textSize;
  Color? hintColor;
  Color? suffixIconColor;
  Color? underlineInputBorder;
  EdgeInsetsGeometry? contentPadding;
  Function(String)? onChange;
  Function(String)? onSumbit;

  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool? isPass;
  bool? visible;

  @override
  void initState() {
    isPass =
        widget.keyboardType == TextInputType.visiblePassword ? true : false;
    visible = isPass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppConstance.primaryColor,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        color: widget.textColor,
        fontSize: widget.textSize ?? 15.0,
        fontWeight: FontWeight.w500,
      ),
      enabled: widget.enable ?? true,
      onChanged: widget.onChange,
      focusNode: widget.focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: visible!,
      minLines: widget.minlines,
      maxLines: widget.maxlines ?? 1,
      maxLength: widget.maxlength,
      onFieldSubmitted: widget.onSumbit,
      onTap: widget.onTap ?? gestureTapCallback(widget.controller),
      inputFormatters: widget.inputFormatter,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        counterText: "",
        isDense: false,
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontSize: widget.hintSize ?? 14.0,
          fontWeight: FontWeight.w500,
        ),
        filled: widget.isFill,
        fillColor: widget.fillColor,
        prefixIcon: widget.prefixIcon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.prefixIcon!,
                ],
              )
            : null,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        // fillColor: whiteColor70,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon ??
            (isPass!
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible!;
                      });
                    },
                    icon: Icon(
                      !visible! ? Icons.visibility : Icons.visibility_off,
                      color:Colors.black,
                    ),
                  )
                : widget.suffixIcon),

        labelText: widget.label,
        labelStyle: const TextStyle(fontSize: 13, color: Colors.redAccent),
        enabledBorder: widget.border ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.radius),
                topRight: Radius.circular(widget.radius),
                bottomRight: Radius.circular(widget.radius),
                bottomLeft: Radius.circular(widget.radius),
              ),
            ),
        // border: widget.border ?? const UnderlineInputBorder(),
        border: widget.border ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.radius),
                topRight: Radius.circular(widget.radius),
                bottomRight: Radius.circular(widget.radius),
                bottomLeft: Radius.circular(widget.radius),
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: .5,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.radius),
            topRight: Radius.circular(widget.radius),
            bottomRight: Radius.circular(widget.radius),
            bottomLeft: Radius.circular(widget.radius),
          ),
        ),
        focusedBorder: widget.border ??
            OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.radius),
                topRight: Radius.circular(widget.radius),
                bottomRight: Radius.circular(widget.radius),
                bottomLeft: Radius.circular(widget.radius),
              ),
            ),
      ),
      validator: widget.validate,
    );
  }
}
