// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'package:dio/dio.dart';
import 'package:technical_assignment/models/article_model.dart';

class ArticleServices {
   Dio dio = Dio();
  String urlLink = 'https://jsonplaceholder.typicode.com/posts';
  
  Future<List<ArticleModel>> postList() async {
       dio.options.contentType = Headers.formUrlEncodedContentType;
        dio.options = BaseOptions(
        baseUrl: urlLink,
        contentType: Headers.jsonContentType);
      try {
      Response response =
          await dio.get(Uri.encodeFull(urlLink));
      if (response.statusCode == 200) {
       var result = response.data as List;
      List<ArticleModel> listData =
          result.map((tagJson) => ArticleModel.fromJson(tagJson)).toList();
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