// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors_in_immutables, avoid_print, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:technical_assignment/controllers/artical_controller.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:technical_assignment/models/article_model.dart';
import 'package:technical_assignment/routes/navigate_route.dart';
import 'package:technical_assignment/utils/appbar.dart';

class ArticalListScreen extends StatefulWidget {
  ArticalListScreen({super.key});

  @override
  State<ArticalListScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ArticalListScreen> {
  List<ArticleModel> postList = [];  
  final ArticleController controller = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: customAppBar(title: controller.homeText, showSettings: true)),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.blue,
        onRefresh: () async {
          controller.articleList().then((values) {
            if (!mounted) return;
            setState(() {
              postList = values;
              controller.pagingController.refresh();
              print('refresh page with posts list length: ${values.length}');
            });
          });
          return Future<void>.delayed(Duration(seconds: 2));
        },
        child: PagingListener(
          controller: controller.pagingController,
          builder: (context, state, fetchNextPage) =>
              PagedListView<int, dynamic>(
                state: state,
                fetchNextPage: fetchNextPage,
                builderDelegate: PagedChildBuilderDelegate(
                  itemBuilder: (context, item, index) {
                    final article = item as ArticleModel;
                    return Card(
                      child: ListTile(
                        onTap: () => {
                          NavigateRoute.goToArticleDetailScreen(article: article),
                        },
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('User Id: ${article.userId.toString()}'),
                            SizedBox(width: 10),
                            Text(
                              article.title.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
        ),
      ),
    );
  }
}
