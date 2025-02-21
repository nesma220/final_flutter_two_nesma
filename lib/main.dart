import 'package:final_flutter_two_nesma/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:final_flutter_two_nesma/message.dart';
import 'package:final_flutter_two_nesma/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/settings_controller.dart';
import 'utils/app_const.dart';
import 'utils/di/di.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await dep.init();
  runApp(MyApp(
    languages: languages,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});
  final Map<String, Map<String, String>> languages;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingsController()..loadCurrentLanguage(),
      builder: (SettingsController controller) {
        return GetMaterialApp(
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode,
              AppConstants.languages[0].countryCode),
          debugShowCheckedModeBanner: false,
          title: 'Test App',
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          locale: controller.locale,
          themeMode: controller.currentTheme.value,
        );
      },
    );
  }
}
