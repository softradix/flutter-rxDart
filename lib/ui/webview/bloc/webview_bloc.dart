import 'dart:ui';

import 'package:bloc_demo_project/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:webview_flutter/webview_flutter.dart';

// This class contains all the observable variables and business logic.
class WebViewBloc extends BaseBloc {
  WebViewController? webViewController;

  //RxDart - observable variable
  //This variable is used to hide and show the loader.
  final isLoading = PublishSubject<bool>();

  initWebView({required String url}) {
    setIsLoading(isLoad: true);

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String? url) {
            setIsLoading(isLoad: true);
          },
          onPageFinished: (String url) {
            setIsLoading(isLoad: false);
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  setIsLoading({required bool isLoad}){
    isLoading.sink.add(isLoad);
  }

  @override
  dispose() {
    //Close the Publisher when class is going to removed from memory.
    isLoading.close();
  }
}
