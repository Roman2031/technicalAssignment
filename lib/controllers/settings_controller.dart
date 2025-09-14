// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print, curly_braces_in_flow_control_structures, void_checks
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_assignment/utils/global.dart';

class SettingsController extends GetxController {
  Global global = Global();
  RxBool isDarkMode = false.obs;
  RxBool isBangla = false.obs;
  RxBool isloading = true.obs;

  //text variables
  var settingsText = "Settings".obs;
  var darkModeText = "Dark Mode".obs;
  var languageText = "Bangla".obs;

  final getStorage = GetStorage();

  void onDarkModeChanged(bool value) {
    isDarkMode.value = value;
    getStorage.write('isDarkMode', value);
    if (value) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    isDarkMode.value = getStorage.read('isDarkMode') ?? false;
    isBangla.value = getStorage.read('isBangla') ?? false;
    global.translator(rxString: settingsText);
    global.translator(rxString: darkModeText);
    if (isBangla.value) {
      languageText.value = "English";
      languageText = await global.translator(rxString: languageText);
    } else {
      languageText.value = "Bangla";
      languageText = await global.translator(rxString: languageText);
    }
    isloading.value = false;
  }

  Future<void> onLanguageChanged(bool value) async {
    isBangla.value = value;
    getStorage.write('isBangla', value);
    settingsText = await global.translator(rxString: settingsText);
    darkModeText = await global.translator(rxString: darkModeText);
    if (isBangla.value) {
      languageText.value = "English";
      languageText = await global.translator(rxString: languageText);
    } else {
      languageText.value = "Bangla";
      languageText = await global.translator(rxString: languageText);
    }
  }
}
