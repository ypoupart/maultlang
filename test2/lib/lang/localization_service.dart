import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'en_US.dart';
import 'hi_IN.dart';
import 'ar_AE.dart';
import 'fr_CA.dart';

class LocalizationService extends Translations {
  static final local = Locale('en', 'US');
  static final fallBackLocale = Locale('en', 'US');
  static final langs = ['English', 'Hendi', 'Arabic', 'Francais'];
  static final locales = [
    Locale('en', 'US'),
    Locale('hi', 'IN'),
    Locale('ar', 'AE'),
    Locale('fr', 'CA')
  ];

  Map<String, Map<String, String>> get keys =>
      {'en_US': enUS, 'hi_IN': hiIN, 'ar_AE': arAE, 'fr_CA': frCA};

  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  Locale getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
