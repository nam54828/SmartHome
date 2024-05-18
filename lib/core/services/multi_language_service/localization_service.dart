import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarthome/core/di_controller.dart';
import 'package:smarthome/core/helper/custom_validate.dart';
import 'package:smarthome/core/services/multi_language_service/language/st_en_us.dart';
import 'package:smarthome/core/services/multi_language_service/language/st_vi_vn.dart';
import 'package:smarthome/core/shared_pref/shared_preference_helper.dart';

class LocalizationService extends Translations {
// Get locale.
  static final locale = _getLocaleFromLanguage();

// Locale default.
  static const fallbackLocale = Locale('en', 'US');

  static final langCodes = [
    'en',
    'vi'
  ];

  // Locale have support.
  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
  ];

// Language data to change.
  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  // Multi Language data to change.
  final homeMultiLangs = LinkedHashMap.from({
    'en': 'English'.tr,
    'vi': 'Vietnamese'.tr,
  });

  ///
  /// On change language.
  ///
  static void changeLocale(String langCode) {
    //
    // Save locale.
    sl<SharedPreferenceHelper>().setLocale(langCode);
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'vi_VN': vi,
  };

  static Locale _getLocaleFromLanguage({String? langCode}) {
    late String lang;

    Locale _locale = fallbackLocale;

    if (CustomValidate.nullOrEmpty(langCode) && !CustomValidate.nullOrEmpty(sl<SharedPreferenceHelper>().getLocale)) {
      lang = sl<SharedPreferenceHelper>().getLocale.toString();
    } else if (!CustomValidate.nullOrEmpty(langCode)) {
      lang = langCode.toString();
    }

    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return _locale = locales[i];
    }

    DefaultCupertinoLocalizations.load(_locale);
    return _locale;
  }
}
