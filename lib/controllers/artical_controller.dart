// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'package:get/get.dart';
import 'package:technical_assignment/models/article_model.dart';
import 'package:technical_assignment/services/article_services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ArticleController extends GetxController {
  RxString homeText = "Home".obs;
  RxString articleDetailText = "Article Detail".obs;

  late final pagingController = PagingController<int, ArticleModel>(
    getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) {
      return articleList();},
    );
    
   Future<List<ArticleModel>> articleList() async {
    final articalServices = ArticleServices();    
    List<ArticleModel> getPosts = await articalServices.articleList();
    return getPosts;
   }
}