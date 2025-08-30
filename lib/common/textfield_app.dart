import 'dart:async';

import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_field/countries.dart' as phone_countries;
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:pinput/pinput.dart';

class TextFieldApp extends StatelessWidget {
  final String? hintext;
  final bool? obscureText;
  final Widget? sufixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onchange;
  final String? Function(String?)? validator;
  final double? radius;
  final int? maxLength;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormater;
  final Widget? prefixIcon;
  // final double? height;
  final EdgeInsets? containsPadding;
  const TextFieldApp({
    super.key,
    this.hintext,
    this.obscureText,
    this.sufixIcon,
    this.controller,
    this.onchange,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.radius,
    this.inputFormater,
    this.decoration,
    // this.height,
    this.containsPadding,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      inputFormatters: inputFormater ?? [],
      validator: validator,
      onChanged: onchange,
      style: appTextStyle.copyWith(
        fontSize: 14,
        color: context.titleLargeColor,
      ),
      cursorColor: primaryColors,
      decoration:
          decoration ??
          InputDecoration(
            hintText: hintext,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: HexColor('F5F6F7'),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
              borderSide: BorderSide(color: HexColor('F5F6FF')),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
              borderSide: BorderSide(
                color: primaryColors.withAlpha((0.3 * 255).round()),
              ),
            ),
            contentPadding: containsPadding,
            hintStyle: appTextStyle.copyWith(
              fontSize: 14,
              color: HexColor('8e8e8e'),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            suffixIcon: sufixIcon,
          ),
    );
  }
}

InputDecoration inputDecorationApp({
  final String? hintext,
  final Widget? sufixIcon,
  double? radius,
  EdgeInsets? containsPadding,
}) {
  return InputDecoration(
    hintText: hintext,
    filled: true,
    fillColor: HexColor('F5F6F7'),
    contentPadding: containsPadding,
    hintStyle: appTextStyle.copyWith(fontSize: 16, color: HexColor('8e8e8e')),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 12),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 12),
      borderSide: BorderSide(
        color: primaryColors.withAlpha((0.3 * 255).round()),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 12),
      borderSide: BorderSide(color: Colors.red.withAlpha((0.3 * 255).round())),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    suffixIcon: sufixIcon,
  );
}

class IntlPhoneFieldApp extends StatelessWidget {
  final String? hintext;
  final bool? obscureText;
  final Widget? sufixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(PhoneNumber)? onchange;
  final double? radius;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final void Function(phone_countries.Country)? onCountryChanged;
  final InputDecoration? decoration;

  const IntlPhoneFieldApp({
    super.key,
    this.hintext,
    this.obscureText,
    this.sufixIcon,
    this.controller,
    this.onchange,
    this.validator,
    this.radius,
    this.keyboardType,

    this.onCountryChanged,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      style: appTextStyle.copyWith(fontSize: 14),
      initialCountryCode: 'CM',
      maxLenght: 9,
      onCountryChanged: onCountryChanged,
      validator: validator,
      controller: controller,
      disableLengthCheck: false,
      decoration:
          decoration ??
          inputDecorationApp(hintext: '--- --- ---').copyWith(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
              borderSide: BorderSide(color: primaryColors),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 12),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
      onChanged: onchange,
    );
  }
}

class OtpFieldApp extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final double? radius;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function(String)? onSubmitted;
  final bool enabled;

  const OtpFieldApp({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.radius,
    this.keyboardType,
    this.obscureText = false,
    this.onSubmitted,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      enabled: enabled,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      errorPinTheme: pinThem(
        radius,
        context,
      ).copyBorderWith(border: Border.all(color: Colors.red)),
      defaultPinTheme: pinThem(radius, context),
      pinAnimationType: PinAnimationType.rotation,
    );
  }
}

PinTheme pinThem(double? radius, BuildContext context) => PinTheme(
  width: getProportionateScreenHeight(50),
  height: getProportionateScreenHeight(50),
  textStyle: appTextStyle.copyWith(
    color: AppThemes.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius ?? 12),
    border: Border.all(color: AppThemes.primaryColor),
  ),
);
