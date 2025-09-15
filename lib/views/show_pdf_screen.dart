// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors_in_immutables, avoid_print, unnecessary_string_interpolations, must_be_immutable
import 'package:flutter/material.dart';
import 'package:technical_assignment/controllers/articale_controller.dart';
import 'package:technical_assignment/utils/appbar.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class ShowPdfScreen extends StatefulWidget {
  String path;
  ShowPdfScreen({super.key, required this.path});

  @override
  State<ShowPdfScreen> createState() => _ShowPdfScreenState();
}

class _ShowPdfScreenState extends State<ShowPdfScreen> {
  final ArticleController controller = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: controller.pdfViewer, showSettings: false),
      body: PDFView(filePath: widget.path),
    );
  }
}
