import 'dart:async';

import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/containar_icon_bouton.dart';
import 'package:afrypay/common/routes.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/common/textfield_app.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // late int? resendToken;
  // late String verificationId;
  // late String phoneNumber;
  final TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Timer? timer;
  int resendTime = 120;

  startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (resendTime > 0) {
        resendTime--;
      } else {
        timer?.cancel();
      }
      setState(() {});
    });
  }

  String getTimerFromResend() {
    int minutes = (resendTime / 60).floor();
    int seconds = (resendTime % 60);
    String minutesString = minutes < 10 ? '0$minutes'.tr : '$minutes'.tr;
    String secondsString = seconds < 10 ? '0$seconds'.tr : '$seconds'.tr;
    return '$minutesString:$secondsString'.tr;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startCountdown();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        leadingWidth: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(onTap: Get.back, child: AppBackButton()),
            const Spacer(),
            Text("Vérification du code".tr),
            const Spacer(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text:
                        "Veuillez indiquer le code à 6 chiffres pour pour une meilleure "
                            .tr,
                    children: [
                      TextSpan(
                        text: "securite",
                        style: appTextStyle.copyWith(
                          color: AppThemes.primaryColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              spacerHeight(40),
              OtpFieldApp(
                obscureText: false,
                controller: otpController,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Veuillez entrer le code de vérification".tr;
                  }
                  if (p0.length < 6) {
                    return "Veuillez entrer un code valide".tr;
                  }
                  return null;
                },
                onChanged: (value) async {
                  if (value.length == 6) {}
                },
              ),
              spacerHeight(20),
              // Padding(
              //   padding: const EdgeInsets.only(right: 30),
              //   child: Text.rich(
              //     textAlign: TextAlign.center,
              //     TextSpan(
              //       children: [
              //         TextSpan(text: "Vous n'avez pas reçu le code ?  ".tr),
              //         TextSpan(
              //           text: resendTime == 0
              //               ? "Renvoyer".tr
              //               : "${"Renvoyer le code dans".tr} ${getTimerFromResend()}"
              //                     .tr,
              //           recognizer: TapGestureRecognizer()
              //             ..onTap = () {
              //               if (resendTime == 0) {
              //                 resenCoderequest();
              //               }
              //             },
              //           style: appTextStyle.copyWith(
              //             color: AppThemes.primaryColor,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const Spacer(flex: 4),
              CustomAppPrimaryButton(
                onpressed: () async {
                  if (formKey.currentState!.validate()) {
                    Get.offAllNamed(home);
                  }
                },
                title: "Vérifier le code",
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkState() async {}

  resenCoderequest() async {}
}
