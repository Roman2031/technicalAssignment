// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print, unused_import
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:technical_assignment/controllers/articale_controller.dart';
import 'package:technical_assignment/models/article_model.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';
import 'package:technical_assignment/utils/appbar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class ArticleDetailsScreen extends StatefulWidget {
  ArticleModel article;
  ArticleDetailsScreen({super.key, required this.article});

  @override
  State<ArticleDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<ArticleDetailsScreen> {
  final ArticleController controller = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: controller.articleDetailText,
        showSettings: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Text('User Id: ${widget.article.userId.toString()}'),
                  Text('Id: ${widget.article.id.toString()}'),
                  SizedBox(height: 10),
                  Text(
                    widget.article.title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.article.body.toString(),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      controller.downloadFileFromServer();
                    },
                    child: Text('Download File'),
                  ),
                  ValueListenableBuilder(
                    valueListenable: controller.downloadProgressNotifier,
                    builder: (context, value, child) {
                      final percentValue = (value is num)
                          ? (value.toDouble() / 100.0)
                          : 0.0;
                      final displayText = "${value ?? 0}%";
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 32),
                          LinearPercentIndicator(
                            barRadius: Radius.circular(10),
                            lineHeight: 15.0,
                            percent: percentValue.clamp(0.0, 1.0),
                            backgroundColor: Colors.grey.shade300,
                            progressColor: Colors.teal,
                          ),
                          SizedBox(height: 15),
                          Text(
                            displayText,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.openPdf();
                    },
                    child: Text('Open File'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
