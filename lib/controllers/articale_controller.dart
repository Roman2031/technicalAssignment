// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_assignment/models/article_model.dart';
import 'package:technical_assignment/routes/navigate_route.dart';
import 'package:technical_assignment/services/article_services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:technical_assignment/utils/global.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class ArticleController extends GetxController {
  Global global = Global();
  final getStorage = GetStorage();
  RxString homeText = "Home".obs;
  RxString articleDetailText = "Article Detail".obs;
  RxString pdfViewer = "Pdf Viewer".obs;
  RxBool isBangla = false.obs;
  ValueNotifier downloadProgressNotifier = ValueNotifier(0);

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    global.translator(rxString: homeText);
    global.translator(rxString: articleDetailText);
  }

  late final pagingController = PagingController<int, ArticleModel>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) {
      return articleList();
    },
  );

  Future<List<ArticleModel>> articleList() async {
    final articalServices = ArticleServices();
    List<ArticleModel> getPosts = await articalServices.articleList();
    return getPosts;
  }

  void downloadFileFromServer() async {
    Directory directory = Directory("");
    if (Platform.isAndroid) {
      directory = (await getExternalStorageDirectory())!;
    } else {
      directory = (await getApplicationDocumentsDirectory());
    }
    await Dio().download(
      "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      '${directory.path}/dummy.pdf',
      onReceiveProgress: (actualBytes, int totalBytes) {
        downloadProgressNotifier.value = (actualBytes / totalBytes * 100)
            .floor();
      },
    );
    print('File downloaded at ${directory.path}/dummy.pdf');
  }

  Future<void> openPdf() async {
    Directory directory = Directory("");
    if (Platform.isAndroid) {
      directory = (await getExternalStorageDirectory())!;
    } else {
      directory = (await getApplicationDocumentsDirectory());
    }
    NavigateRoute.goToShowPdfScreen(
      path:
          '${directory.path}/dummy.pdf',
    );
  }
}
