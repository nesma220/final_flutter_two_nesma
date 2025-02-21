import 'dart:convert';

import 'package:final_flutter_two_nesma/controllers/settings_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../app_const.dart';
import '../lang_model/lang_model.dart';

Future<Map<String, Map<String, String>>> init() async {
  Get.lazyPut(() => SettingsController());

  Map<String, Map<String, String>> _languages = Map();
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('locales/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);

    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });

    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return _languages;
}
