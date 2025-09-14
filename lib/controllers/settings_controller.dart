// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print, curly_braces_in_flow_control_structures, void_checks
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_assignment/services/translate_service.dart';

class SettingsController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxBool isBangla = false.obs;
  

  //text variables
  String settingsText = "Settings";

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

  void onLanguageChanged(bool value) {
    isBangla.value = value;
    getStorage.write('isBangla', value);    
  } 

  Future<void> translateToBangla({required String text}) async {    
    TranslateService translateService = TranslateService();    
    if (isBangla.value == false)
    return translateService.translateToBangla(text: text).then( (value) {
        settingsText = value;
    });
    else
     return translateService.translateToEnglish(text: text).then( (value) {
        settingsText = value;   
    });
  }

  
}
