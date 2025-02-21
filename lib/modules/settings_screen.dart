import 'package:final_flutter_two_nesma/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SettingsScreen extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());

   SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Language".tr),
                Obx(() => Row(
                      children: [
                        languageButton("EN", "en"),
                        languageButton("ع", "ar"),
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Theme Dark".tr),
                Obx(
                  () => Switch(
                    value: controller.currentTheme.value == ThemeMode.dark,
                    onChanged: (value) {
                      controller.switchTheme();
                      Get.changeThemeMode(controller.currentTheme.value);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget languageButton(String label, String langCode) {
    return GestureDetector(
      onTap: () => settingsController.setLanguage(Locale(langCode)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: settingsController.selectedLanguage.value == langCode
              ? Colors.black
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: settingsController.selectedLanguage.value == langCode
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
