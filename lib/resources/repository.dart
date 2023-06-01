import 'dart:async';

import 'package:bloc_demo_project/models/news_response_model.dart';
import 'package:bloc_demo_project/resources/news_api_provider.dart';

// This class is the intermediate class between the bloc and provider.
class Repository {
  final newsApiProvider = NewApiProvider();

  Future<NewsResponseModel> fetchAllMovies() => newsApiProvider.fetchMovieList();
}