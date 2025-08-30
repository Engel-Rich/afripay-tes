import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class Oauth2Buttons extends StatelessWidget {
  const Oauth2Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppPrimaryButton(
          onpressed: () async {},
          color: Colors.transparent,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/google.svg"),
              spacerWidth(15),
              Text(
                "Se connecter avec Google",
                style: appTextStyle.copyWith(
                  fontSize: 16,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          border: Border.all(color: AppThemes.primaryColor),
          radius: 8,
        ),
        spacerHeight(15),
        CustomAppPrimaryButton(
          onpressed: () {},
          color: Colors.transparent,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.apple, size: 27),
              spacerWidth(15),
              Text(
                "Se connecter avec Apple",
                style: appTextStyle.copyWith(
                  fontSize: 16,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          border: Border.all(color: AppThemes.primaryColor),
          radius: 8,
        ),
      ],
    );
  }
}

class OrAuthLine extends StatelessWidget {
  const OrAuthLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: HexColor("79828E"))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "OU",
            style: appTextStyle.copyWith(
              color: HexColor("79828E"),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(child: Divider(color: HexColor("79828E"))),
      ],
    );
  }
}
