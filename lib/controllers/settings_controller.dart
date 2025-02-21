import 'package:get/get.dart';
import 'package:flutter/material.dart';



class SettingsController extends GetxController {
  var selectedLanguage = 'en'.obs;
  var isDarkMode = false.obs;

  void changeLanguage(String langCode) {
    selectedLanguage.value = langCode;
    Get.updateLocale(Locale(langCode));
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
