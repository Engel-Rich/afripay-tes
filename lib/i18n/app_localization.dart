import 'package:afrypay/i18n/de.dart';
import 'package:afrypay/i18n/en.dart';
import 'package:afrypay/i18n/es.dart';
import 'package:afrypay/i18n/fr.dart';
import 'package:afrypay/i18n/zh.dart';

abstract class AppLocalization {
  static Map<String, Map<String, String>> translationsKeys = {
    'fr_FR': francais,
    'en_EN': anglais,
    'fr_CA': francais,
    'en_US': anglais,
    'zh_CN': chinois,
    'es_ES': espagnol,
    'de_DE': allemand,
  };
}
