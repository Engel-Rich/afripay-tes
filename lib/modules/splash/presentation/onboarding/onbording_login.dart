import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/routes.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/modules/auth/presentation/components/oauth2_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';

class OnboardingLoginScreen extends StatefulWidget {
  const OnboardingLoginScreen({super.key});

  @override
  State<OnboardingLoginScreen> createState() => _OnboardingLoginScreenState();
}

class _OnboardingLoginScreenState extends State<OnboardingLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Image.asset("assets/fric.png", height: 90.h, width: 200.w),
              spacerHeight(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Effectuez des paiements sécurisés en un clic directement sur votre telephone",
                  style: appTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppThemes.primaryblue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              spacerHeight(20),
              Image.asset('assets/onbording3.png'),
              spacerHeight(20),
              CustomAppPrimaryButton(
                onpressed: () {
                  Get.toNamed(login);
                },
                title: "Se Connecter",
                color: HexColor("E6E8F2"),
                radius: 8,
              ),
              spacerHeight(12),
              CustomAppPrimaryButton(
                onpressed: () {
                  Get.toNamed(register);
                },
                title: "Créer un comte",
                radius: 8,
              ),
              const Spacer(flex: 3),
              OrAuthLine(),
              spacerHeight(25),
              Oauth2Buttons(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
