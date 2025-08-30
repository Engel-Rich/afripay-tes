import 'package:afrypay/common/routes.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:relax/splash/controllers/splash_controller.dart';

// import 'package:relax/utils/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(milliseconds: 1750),
      ).then((value) => Get.offAllNamed(onboarding));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        height: double.infinity,
        width: double.infinity,
        child: Center(child: Image.asset("assets/fric.png", height: 100.h)),
      ),
    );
  }
}
