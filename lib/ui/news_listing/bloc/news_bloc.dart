import 'package:bloc_demo_project/bloc/base_bloc.dart';
import 'package:bloc_demo_project/models/news_response_model.dart';
import 'package:bloc_demo_project/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

// This class contains all the observable variables and business logic.
class NewsBloc extends BaseBloc {
  final _repository = Repository();
  final _newsFetcher = PublishSubject<NewsResponseModel>();

  NewsBloc(){
    fetchAllMovies();
  }

  //RxDart - observable variable
  //This variable is used to update all the news in the ui.
  Stream<NewsResponseModel> get allNews => _newsFetcher.stream;

  //This function calls the News api.
  fetchAllMovies() async {
    NewsResponseModel newsResponseModel = await _repository.fetchAllMovies();
    _newsFetcher.sink.add(newsResponseModel);
  }

  @override
  dispose() {
    //Close the Publisher when class is going to removed from memory.
    _newsFetcher.close();
  }

}
