// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class SettingsController extends GetxController {    
    RxBool isDarkMode = false.obs;

    void onDarkModeChanged(bool value) {
      isDarkMode.value = value;
      final getStorage = GetStorage();
      getStorage.write('isDarkMode', value);
      if (value) {
        Get.changeTheme(ThemeData.dark());
      } else {
        Get.changeTheme(ThemeData.light());
      }
    }
}