import 'package:bloc_demo_project/common/common_widgets/common_app_bar.dart';
import 'package:bloc_demo_project/common/common_widgets/common_loader_widget.dart';
import 'package:bloc_demo_project/common/constants/string_constants.dart';
import 'package:bloc_demo_project/models/news_response_model.dart';
import 'package:bloc_demo_project/ui/news_listing/bloc/news_bloc.dart';
import 'package:bloc_demo_project/ui/news_listing/extension/news_listing_screen_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//This class contains the UI part for news listing.
class NewsApiListingScreen extends StatefulWidget {
  const NewsApiListingScreen({Key? key}) : super(key: key);

  @override
  State<NewsApiListingScreen> createState() => _NewsApiListingScreenState();
}

class _NewsApiListingScreenState extends State<NewsApiListingScreen> {
  var newsBloc = NewsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: StringConstants.news),
    body: StreamBuilder(
        stream: newsBloc.allNews,
        builder: (context, AsyncSnapshot<NewsResponseModel> snapshot) {
          if (snapshot.hasData) {
            return widget.buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return commonLoaderWidget();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    newsBloc.dispose();
  }
}
