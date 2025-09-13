import 'package:get/get.dart';
import 'package:technical_assignment/models/article_model.dart';
import 'package:technical_assignment/services/article_services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ArticalController extends GetxController {
  late final pagingController = PagingController<int, ArticleModel>(
    getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) {
      return postList();},
    );
    
   Future<List<ArticleModel>> postList() async {
    final articalServices = ArticleServices();    
    List<ArticleModel> getPosts = await articalServices.postList();
    return getPosts;
   }
}