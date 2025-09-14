// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'package:translator/translator.dart';

class TranslateService {
  Future<String> translateToBangla({required String text}) async {
    var result = await text.translate(to: 'bn');
    print('Translated: ${result.text}');
    return result.text;
  }
    Future<String> translateToEnglish({required String text}) async {
    var result = await text.translate(to: 'en');
    print('Translated: ${result.text}');
    return result.text;
  }
}



