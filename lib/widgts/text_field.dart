import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color_constant.dart';

Widget textField2(
    {TextEditingController? controller,
    String? hintText,
    String? labelText,
    void Function(String val)? onChanged,
    void Function(String? val)? onSaved,
    void Function()? onVisibility,
    String? Function(String? val)? validator,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? inputType,
    int? line,
    FocusNode? focusNode,
    bool? readOnly,
    bool? obscureText,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextStyle? counterStyle,
    int? maxLength,
    bool autoFocus = false,
    OutlineInputBorder? focusedErrorBorder,
    OutlineInputBorder? enabledBorder,
    OutlineInputBorder? focusedBorder,
    OutlineInputBorder? errorBorder,
    TextAlign? textAlign,
    Widget? suffixIcon,
    TextAlignVertical? textAlignVertical}) {
  return TextFormField(
    focusNode: focusNode,
    textAlignVertical: textAlignVertical,
    textAlign: textAlign ?? TextAlign.start,
    controller: controller,
    onChanged: onChanged,
    maxLength: maxLength,
    autofocus: autoFocus,
    validator: validator,
    readOnly: readOnly ?? false,
    obscureText: obscureText ?? false,
    inputFormatters: inputFormatters,
    maxLines: line ?? 1,
    obscuringCharacter: '*',
    keyboardType: inputType,
    decoration: dropDownDecoration2(
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        counterStyle: counterStyle,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder),
  );
}

dropDownDecoration2(
    {String? hintText,
    String? labelText,
    TextStyle? hintStyle,
    TextStyle? counterStyle,
    TextStyle? labelStyle,
    OutlineInputBorder? focusedErrorBorder,
    OutlineInputBorder? enabledBorder,
    OutlineInputBorder? focusedBorder,
    OutlineInputBorder? errorBorder,
    Widget? suffixIcon}) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    counterStyle: counterStyle ??
        const TextStyle(color: ColorConstant.transparent, height: 0),
    labelText: labelText,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 10.5, horizontal: 7),
    hintText: hintText ?? "Hint Text",
    hintStyle: hintStyle ??
        const TextStyle(
            color: Colors.grey, fontSize: 12, fontFamily: "OpenSans"),
    filled: true,
    fillColor: Colors.white,
    labelStyle: labelStyle ?? TextStyle(color: ColorConstant.primaryColor),
    errorStyle: const TextStyle(height: 0, fontSize: 0),
    enabledBorder: enabledBorder ??
        OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstant.grey300),
            borderRadius: BorderRadius.circular(4.0)),
    focusedBorder: focusedBorder ??
        OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstant.primaryColor),
            borderRadius: BorderRadius.circular(4.0)),
    errorBorder: errorBorder ??
        const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
    focusedErrorBorder: focusedErrorBorder ??
        const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
  );
}
