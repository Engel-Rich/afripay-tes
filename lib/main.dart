import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/routes.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/i18n/app_localization.dart';
import 'package:afrypay/modules/home/controllers/app_controller.dart';
import 'package:afrypay/modules/splash/controllers/app_settings_controller.dart';
import 'package:afrypay/modules/splash/controllers/onboarding_controller.dart';
import 'package:afrypay/modules/transactions/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppSettingsController());
  Get.put(ApppController());
  Get.put(TransactionsController());
  Get.lazyPut(() => OnboardingController());

  runApp(const AfriAPaySolutionApp());
}

class AfriAPaySolutionApp extends StatelessWidget {
  const AfriAPaySolutionApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return UnfocusWrapper(
      child: GetBuilder<AppSettingsController>(
        builder: (controller) {
          return GetMaterialApp(
            initialRoute: splash,
            debugShowCheckedModeBanner: false,
            locale: controller.langageModel.locale,
            translationsKeys: AppLocalization.translationsKeys,
            getPages: pagesRoute,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: controller.themeMode,
          );
        },
      ),
    );
  }
}

class UnfocusWrapper extends StatelessWidget {
  final Widget child;

  const UnfocusWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
