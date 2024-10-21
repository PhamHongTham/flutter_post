// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:post/core/styles/appColors.dart';
import 'package:post/core/styles/appStyle.dart';

// ignore: camel_case_types
class Custom_TextField extends StatefulWidget {
  const Custom_TextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.color,
    required this.hintText,
    this.hintStyle,
    required this.prefixIcon,
    required this.validator,
    required this.keyboardType,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final String? labelText;
  final Color? color;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;

  @override
  State<Custom_TextField> createState() => _Custom_TextFieldState();
}

// ignore: camel_case_types
class _Custom_TextFieldState extends State<Custom_TextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: Appstyle.labelStyle,
        hintText: widget.hintText, // Văn bản gợi ý
        hintStyle: Appstyle.hintStyle, // Kiểu chữ của văn bản gợi ý
        prefixIcon: widget.prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Góc bo của đường viền
          borderSide: Appstyle.borderSide, // Đường viền khi không chọn
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: Appstyle.borderSide20,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: Appstyle.borderSize20_red,
        ),
        filled: true, // Tô màu nền cho TextField
        fillColor: AppColor.fillColor, // Màu nền của TextField
        contentPadding:
            Appstyle.contentPadding, // Khoảng cách bên trong TextField
      ),
      style: Appstyle.style,
      cursorColor: AppColor.colorIcons,
      // Màu sắc của con trỏ
    );
  }
}
