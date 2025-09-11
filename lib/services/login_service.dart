import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'dart:io';

class LoginService {
   final Dio _dio = Dio();

  Future<String?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://reqres.in/api/login',
        options: Options(headers: {Headers.contentTypeHeader: Headers.jsonContentType, Headers.wwwAuthenticateHeader: 'reqres-free-v1'}),
        data: {'email': email, 'password': password},
      );
      print(response);
      if (response.statusCode == 200 && response.data['reqres-free-v1'] != null) {
        return response.data['reqres-free-v1'];
      }

      return null;
    } on DioException catch (e) {
      throw Exception('Login failed: ${e.response?.data['error'] ?? e.message}');
    }
  }
}
