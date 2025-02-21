import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  var selectedLanguage = 'en'.obs;
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSettings(); 
  }

  void changeLanguage(String langCode) async {
    selectedLanguage.value = langCode;
    Get.updateLocale(Locale(langCode));
    saveSettings(); 
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    saveSettings(); 
  }

  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', selectedLanguage.value);
    await prefs.setBool('darkMode', isDarkMode.value);
  }

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedLanguage.value = prefs.getString('language') ?? 'en';
    isDarkMode.value = prefs.getBool('darkMode') ?? false;
    Get.updateLocale(Locale(selectedLanguage.value));
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
