import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:technical_assignment/models/user_model.dart';
import 'package:technical_assignment/utils/global.dart';

class LoginService {
   Dio dio = Dio();
  String urlLink = "${Global.endPoint}login";

  Future<String?> login({required UserModel userModel}) async {
       dio.options.contentType = Headers.formUrlEncodedContentType;
        dio.options = BaseOptions(
        baseUrl: urlLink,
        contentType: Headers.jsonContentType,
        headers: {'x-api-key': 'reqres-free-v1'});

        var dataParam = jsonEncode({
      'email': userModel.email,
      'password': userModel.password,
    });
      try {
      Response response =
          await dio.post(Uri.encodeFull(urlLink), data: dataParam);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        var result = data["token"];
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
