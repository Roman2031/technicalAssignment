import 'package:flutter/material.dart';
import 'package:technical_assignment/controllers/settings_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_assignment/utils/appbar.dart';
import 'package:get_storage/get_storage.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsController controller = Get.put(SettingsController());
  GetStorage getStorage = GetStorage();

  @override
  void initState() {
    super.initState();
    // ✅ Called once when the widget is created
    controller.isDarkMode.value = getStorage.read('isDarkMode') ?? false;
    print("Widget initialized!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Settings', showSettings: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => SwitchListTile(
                activeThumbColor: Colors.teal,
                title: Text('Dark Mode'),
                value: controller.isDarkMode.value,
                onChanged: (value) {
                  controller.isDarkMode.value = value;
                  if (value) {
                    Get.changeTheme(ThemeData.dark());
                  } else {
                    Get.changeTheme(ThemeData.light());
                  }
                  getStorage.write('isDarkMode', value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
