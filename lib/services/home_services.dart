import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:technical_assignment/models/post_model.dart';

class HomeServices {
   Dio dio = Dio();
  String urlLink = 'https://jsonplaceholder.typicode.com/posts';
  
  Future<List<PostModel>> postList() async {
       dio.options.contentType = Headers.formUrlEncodedContentType;
        dio.options = BaseOptions(
        baseUrl: urlLink,
        contentType: Headers.jsonContentType);
      try {
      Response response =
          await dio.get(Uri.encodeFull(urlLink));
      if (response.statusCode == 200) {
       var result = response.data as List;
      List<PostModel> listData =
          result.map((tagJson) => PostModel.fromJson(tagJson)).toList();
      return listData;
      } else {
        throw Exception("Error");
      }
    } catch (error, stackTrace) {
      print("Exception occurred: $error  stackTrace: $stackTrace");
      return throw Exception("Error");
    }
  }
}