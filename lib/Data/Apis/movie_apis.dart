// ignore_for_file: avoid_print, unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fun_movies/Constants/strings.dart';

class MovieApis {
  Dio? dio;
  Duration x = const Duration(seconds: 60);
  MovieApis() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: x,
      receiveTimeout: x,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getOneMovie() async {
    List all = [];
    try {
      for (int i = 11; i <= 22; i++) {
        Response response =
            await dio!.get('movie/$i?api_key=32ae98bc0a820ec21ef909c192eb04f5');
        print(response.data.toString());
        all.add(response.data);
      }
      return all;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
