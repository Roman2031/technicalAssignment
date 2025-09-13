import 'dart:convert';
import 'package:dio/dio.dart';

class SetingsService {
  Future<String> translateToBangla(String text) async {
    Dio dio = Dio();
    String urlLink = 'https://jsonplaceholder.typicode.com/posts';
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options = BaseOptions(
      baseUrl: urlLink,
      contentType: Headers.jsonContentType,
    );
    try {
      Response response = await dio.get(Uri.encodeFull(urlLink));
      if (response.statusCode == 200) {
        var result = response.data as String;
        return result;
      } else {
        throw Exception("Error");
      }
    } catch (error, stackTrace) {
      print("Exception occurred: $error  stackTrace: $stackTrace");
      return throw Exception("Error");
    }
  }
}
