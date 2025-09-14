// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print, unused_import, curly_braces_in_flow_control_structures
import 'package:technical_assignment/services/translate_service.dart';
import 'package:translator/translator.dart';
import 'package:get_storage/get_storage.dart';

class Global {
  static String endPoint = "https://reqres.in/api/";

  Future<String> translateToBangla({required String text}) {
    TranslateService translateService = TranslateService();
    final getStorage = GetStorage();
    bool isBangla = getStorage.read('isBangla') ?? false;

    if (isBangla)
    return translateService.translateToEnglish(text: text);
    else
    return Future.value(text);
  }
}
