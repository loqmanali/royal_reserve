import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import 'custom_text.dart';

mixin FormFieldProperties {
  String get keyName;
  String get hintText;
  String? Function(String?)? get onValidate;
  String? Function(String?)? get onSaved;
  TextEditingController? get controller;
  int? get maxLength;
  String get initialValue;
  bool get obscureText;
  double get fontSize;
  double get hintFontSize;
  EdgeInsets get padding;
  Icon? get prefixIcon;
  Widget? get suffixIcon;
  double get borderRadius;
  Color get borderColor;
  Color get borderFocusColor;
  double get borderWidth;
  double get focusedBorderWidth;
  double get enabledBorderWidth;
  bool get showPrefixIcon;
  Color get prefixIconColor;
  EdgeInsets get prefixIconPadding;
  bool get isMultiline;
  Function? get onChange;
  Color get textColor;
  Color get hintColor;
  Color get validationColor;
  double get contentPadding;
  int get multilineRows;
  TextInputType get keyboardType;
  Color get backgroundColor;
  bool get readOnly;
  Function? get onTap;
}

class TextFieldComponent extends StatelessWidget with FormFieldProperties {
  @override
  final String keyName;
  @override
  final String hintText;
  @override
  final String? Function(String?)? onValidate;
  @override
  final String? Function(String?)? onSaved;
  @override
  final TextEditingController? controller;
  @override
  final int? maxLength;
  @override
  final String initialValue;
  @override
  final bool obscureText;
  @override
  final double fontSize;
  @override
  final double hintFontSize;
  @override
  final EdgeInsets padding;
  @override
  final Icon? prefixIcon;
  @override
  final Widget? suffixIcon;
  @override
  final double borderRadius;
  @override
  final Color borderColor;
  @override
  final Color borderFocusColor;
  @override
  final double borderWidth;
  @override
  final double focusedBorderWidth;
  @override
  final double enabledBorderWidth;
  @override
  final bool showPrefixIcon;
  @override
  final Color prefixIconColor;
  @override
  final EdgeInsets prefixIconPadding;
  @override
  final bool isMultiline;
  @override
  final Function? onChange;
  @override
  final Color textColor;
  @override
  final Color hintColor;
  @override
  final Color validationColor;
  @override
  final double contentPadding;
  @override
  final int multilineRows;
  @override
  final TextInputType keyboardType;
  @override
  final Color backgroundColor;
  @override
  final Function? onTap;
  @override
  final bool readOnly;

  const TextFieldComponent({
    super.key,
    required this.keyName,
    required this.hintText,
    this.onValidate,
    this.onSaved,
    this.controller,
    this.maxLength,
    this.initialValue = "",
    this.obscureText = false,
    this.fontSize = 18,
    this.hintFontSize = 15,
    this.padding = const EdgeInsets.symmetric(horizontal: 0.0),
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 5.0,
    this.borderColor = AppColors.borderColor,
    this.borderFocusColor = AppColors.borderColor,
    this.borderWidth = 2,
    this.focusedBorderWidth = 2,
    this.enabledBorderWidth = 1,
    this.showPrefixIcon = false,
    this.prefixIconColor = Colors.redAccent,
    this.prefixIconPadding = const EdgeInsets.all(0),
    this.isMultiline = false,
    this.onChange,
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.validationColor = Colors.redAccent,
    this.contentPadding = 6,
    this.multilineRows = 10,
    this.keyboardType = TextInputType.text,
    this.backgroundColor = Colors.white,
    this.onTap,
    this.readOnly = false,
  });

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: backgroundColor,
      contentPadding: EdgeInsets.all(contentPadding),
      errorStyle: TextStyle(color: validationColor),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: hintFontSize,
        color: hintColor,
      ),
      hintText: hintText,
      enabledBorder: _buildBorder(enabledBorderWidth),
      border: _buildBorder(borderWidth),
      focusedBorder: _buildBorder(focusedBorderWidth, borderFocusColor),
      suffixIcon: suffixIcon,
      prefixIcon: showPrefixIcon ? _buildPrefixIcon() : null,
    );
  }

  OutlineInputBorder _buildBorder(double width, [Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: color ?? borderColor,
        width: width,
      ),
    );
  }

  Widget _buildPrefixIcon() {
    return Padding(
      padding: prefixIconPadding,
      child: IconTheme(
        data: IconThemeData(color: prefixIconColor),
        child: prefixIcon!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: () => onTap?.call(),
        maxLines: isMultiline ? multilineRows : 1,
        maxLength: maxLength,
        cursorColor: AppColors.brightBlue,
        validator: onValidate,
        onSaved: onSaved,
        onChanged: (value) => onChange?.call(value),
        style: TextStyle(fontSize: fontSize, color: textColor),
        decoration: _buildInputDecoration(),
      ),
    );
  }
}

class TextFieldComponentWithLabel extends StatelessWidget {
  final String labelName;
  final double labelFontSize;
  final bool labelBold;
  final Color? labelColor;
  final TextFieldComponent formField;
  final EdgeInsets labelPadding;

  const TextFieldComponentWithLabel({
    super.key,
    required this.labelName,
    this.labelFontSize = 15.0,
    this.labelBold = true,
    this.labelColor,
    required this.formField,
    this.labelPadding = const EdgeInsets.only(
      left: 0.0,
      right: 0.0,
      bottom: 5,
      top: 10.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: labelPadding,
            child: CustomText(
              text: labelName,
              style: InputLabelStyle(
                style: TextStyle(
                  color: labelColor,
                  fontSize: labelFontSize,
                ),
              ),
            ),
          ),
          formField,
        ],
      ),
    );
  }
}
