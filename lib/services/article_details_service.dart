// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ArticleDetailsServices{
  Future<void> downloadFileFromServer() async {
  ValueNotifier downloadProgressNotifier = ValueNotifier(0);
    Directory directory = Directory("");
    if (Platform.isAndroid) {
      directory = (await getExternalStorageDirectory())!;
    } else {
      directory = (await getApplicationDocumentsDirectory());
    }
    await Dio().download(
        "https://sample-videos.com/img/Sample-jpg-image-5mb.jpg",
        '${directory.path}/sampleImage.pdf',
        onReceiveProgress: (actualBytes, int totalBytes) {
      downloadProgressNotifier.value = (actualBytes / totalBytes * 100).floor();
    });
    print('File downloaded at ${directory.path}/samplePDF.pdf');
  }
}