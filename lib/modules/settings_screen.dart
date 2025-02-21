import 'package:final_flutter_two_nesma/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
     
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Language"),
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
                const Text("Theme Dark"),
                Obx(() => Switch(
                      value: settingsController.isDarkMode.value,
                      onChanged: (value) {
                        settingsController.toggleTheme();
                      },
                    )),
              ],
            ),

            const SizedBox(height: 30),

    
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              onPressed: () {
                settingsController.saveSettings();
                Get.snackbar("Settings Saved", "Your preferences have been saved!",
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: const Text("SAVE SETTINGS", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget languageButton(String label, String langCode) {
    return GestureDetector(
      onTap: () => settingsController.changeLanguage(langCode),
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
