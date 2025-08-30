import 'dart:ui';

import 'package:afrypay/i18n/langage_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSettingsController extends GetxController {
  // final LocalStorageService _localStorageService;

  // AppSettingsController(this._localStorageService);

  ThemeMode themeMode = ThemeMode.light;

  String appTheme = "light";

  bool get isDarkMode => appTheme == "dark";

  void toggleTheme(bool isDarkMode) {
    appTheme = isDarkMode ? "dark" : "light";
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    // _localStorageService.storeAppTheme(appTheme);
    update();
  }

  void initTheme() {
    // appTheme = _localStorageService.getAppTheme();
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  LangageModel langageModel = languageList[0];

  bool get isFr => langageModel.locale.languageCode == "fr";
  bool get isEn => langageModel.locale.languageCode == "en";
  bool get isEs => langageModel.locale.languageCode == "es";
  bool get isDe => langageModel.locale.languageCode == "de";
  bool get isZh => langageModel.locale.languageCode == "zh";

  Future checklocal() async {
    final deviceLocale = PlatformDispatcher.instance.locale;
    final loc = deviceLocale;
    // _localStorageService.getCurrentLocal() ??
    // (
    //   ["en", "fr", "es", "de", "zh"].contains(deviceLocale.languageCode)
    //       ? deviceLocale
    //       : 'fr',
    // );
    langageModel = languageList.firstWhere(
      (element) => element.locale.languageCode == loc,
      orElse: () => languageList[0],
    );
    changeLangaue(langageModel);
  }

  changeLangaue(LangageModel langageModel) async {
    this.langageModel = langageModel;
    try {
      update();
    } catch (e) {
      // Utils.logger("Error updating language: $e");
    } finally {
      await updateLocal(langageModel.locale);
    }
  }

  Future updateLocal(Locale locale) async {
    Get.updateLocale(locale);
    // await _localStorageService.storeCurrentLocal(locale.languageCode);
  }

  @override
  void onInit() {
    super.onInit();
    initTheme();
    checklocal();
  }
}
