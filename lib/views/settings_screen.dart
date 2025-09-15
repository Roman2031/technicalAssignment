// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors_in_immutables, avoid_print, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:technical_assignment/controllers/settings_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_assignment/utils/appbar.dart';
import 'package:technical_assignment/utils/global.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsController controller = Get.put(SettingsController());
  Global global = Global();
  GetStorage getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: controller.settingsText, showSettings: false),
      body: Center(
        child: Obx(() {
          if (controller.isloading.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ); // Show loader
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => SwitchListTile(
                    activeThumbColor: Colors.teal,
                    title: Obx(() => Text('${controller.darkModeText}')),
                    value: controller.isDarkMode.value,
                    onChanged: (value) {
                      controller.onDarkModeChanged(value);
                    },
                  ),
                ),
                Obx(
                  () => SwitchListTile(
                    activeThumbColor: Colors.teal,
                    title: Obx(() => Text('${controller.languageText}')),
                    value: controller.isBangla.value,
                    onChanged: (value) {
                      controller.onLanguageChanged(value);
                    },
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
