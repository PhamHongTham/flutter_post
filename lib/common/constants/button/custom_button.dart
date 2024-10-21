import 'package:flutter/material.dart';
import 'package:post/core/styles/appStyle.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.style,
    this.onPressed,
    this.isDisable = false,
    this.width,
    this.height,
    this.gradient,
    this.color,
    this.isloading,
    this.borderRadius,
  });
  final String? text;
  final TextStyle? style;
  final VoidCallback? onPressed;
  final bool isDisable;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final Color? color;
  final bool? isloading;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isDisable ? null : onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: gradient,
              color: color,
              boxShadow: [Appstyle.boxShadow]),
          child: Center(
            child: isloading == true
                ? const CircularProgressIndicator()
                : Text(
                    text!,
                    style: style,
                  ),
          ),
        ));
  }
}
