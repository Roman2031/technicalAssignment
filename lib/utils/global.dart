// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print, unused_import, curly_braces_in_flow_control_structures
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:technical_assignment/services/translate_service.dart';
import 'package:translator/translator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class Global {
  static String endPoint = "https://reqres.in/api/";

  Future<RxString> translator({required RxString rxString}) async {
    TranslateService translateService = TranslateService();
    final getStorage = GetStorage();
    if (getStorage.read('isBangla') ?? false)
      translateService.translateToBangla(text: rxString.value).then((value) {
        rxString.value = value;
      });
    else
      translateService.translateToEnglish(text: rxString.value).then((value) {
        rxString.value = value;
      });
    return rxString;
  }

Future<void> getAccess() async {
    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }

    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request();
    print(statuses[Permission.location]);
  }  
}
