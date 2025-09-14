// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors_in_immutables, avoid_print, unnecessary_string_interpolations
import 'package:get/get.dart';
import 'package:technical_assignment/controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}