import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:dio/dio.dart';

import 'package:mockstar/utils/constants.dart';

class Base {
  static Dio dio = Dio()
    ..options.baseUrl = Constants.kTmdbApiBaseUrl
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options) async {
          // Real Data
          if (!Constants.kIsMock) {
            print('Real Data');
            return options;
          }

          // Mock Data
          switch (options.path) {
            case '/trending/movie/day':
              print('Mock /trending/movie/day');
              return await dio.resolve(
                jsonDecode(
                  await rootBundle
                      .loadString('assets/mocks/trending_movie_day.json'),
                ),
              );

            case '/trending/tv/day':
              print('Mock /trending/tv/day');
              return await dio.resolve(
                jsonDecode(
                  await rootBundle
                      .loadString('assets/mocks/trending_tv_day.json'),
                ),
              );
          }

          // Real Data
          print('Real Data');
          return options;
        },
      ),
    );
}
