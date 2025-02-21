import 'package:final_flutter_two_nesma/utils/app_const.dart';
import 'package:final_flutter_two_nesma/utils/lang_model/lang_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';



class SettingsController extends GetxController implements GetxService {
  SettingsController() {
    loadCurrentLanguage();
  }
  var selectedLanguage = 'en'.obs;
  var isDarkMode = false.obs;

  void changeLanguage(String langCode) {
    selectedLanguage.value = langCode;
    Get.updateLocale(Locale(langCode));
  }


  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;


  void switchTheme() {
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  Locale _locale = Locale(AppConstants.languages[0].languageCode,
      AppConstants.languages[0].countryCode);

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  List<LanguageModel> _languages = [];
  Locale get locale => _locale;
  List<LanguageModel> get languages => _languages;

  void loadCurrentLanguage() {


    for (int index = 0; index < AppConstants.languages.length; index++) {
      if (AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;

    update();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    update();
  }
}
