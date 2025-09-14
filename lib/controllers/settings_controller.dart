import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_assignment/routes/navigate_route.dart';
import 'package:get_storage/get_storage.dart';
class SettingsController extends GetxController {    
    RxBool isDarkMode = false.obs;    

   void logout() {
      final getStorage = GetStorage();
      getStorage.remove('token');
      NavigateRoute.goToLoginScreen();
    }
}