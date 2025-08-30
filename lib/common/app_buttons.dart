import 'package:afrypay/common/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAppPrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final VoidCallback onpressed;
  final Widget? widget;
  final String? title;
  final double? radius;
  final Color? color;
  final Color? disableColors;
  final BoxBorder? border;
  final bool disabled;
  final double? fontSize;
  final Color? textColor;
  const CustomAppPrimaryButton({
    super.key,
    required this.onpressed,
    this.height,
    this.title,
    this.radius,
    this.border,
    this.color,
    this.widget,
    this.disableColors,
    this.disabled = false,
    this.fontSize,
    this.textColor,
    this.width,
  }) : assert(widget == null || title == null, "");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: color ?? primaryColors,
          borderRadius: BorderRadius.circular(radius ?? 12),
          border: border,
        ),
        child:
            widget ??
            Center(
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: appTextStyle.copyWith(
                  fontSize: fontSize ?? 16,
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      ),
    );
  }
}
