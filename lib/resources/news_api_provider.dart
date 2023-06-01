import 'package:bloc_demo_project/common/network/ApiHitter.dart';
import 'package:bloc_demo_project/common/network/end_points.dart';
import 'package:bloc_demo_project/models/news_response_model.dart';
import 'package:dio/dio.dart';

// This class contains all the api methods.
class NewApiProvider{
  Future<NewsResponseModel> fetchMovieList() async {
    print("entered");
    Response response = await ApiHitter.shared.getApi(endPoint: EndPoints.newsApi);
    print(response.data.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var newsModel = NewsResponseModel.fromJson(response.data);
      return newsModel;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}