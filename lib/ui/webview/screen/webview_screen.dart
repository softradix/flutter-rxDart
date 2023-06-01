import 'package:bloc_demo_project/common/common_widgets/common_app_bar.dart';
import 'package:bloc_demo_project/common/common_widgets/common_loader_widget.dart';
import 'package:bloc_demo_project/common/constants/string_constants.dart';
import 'package:bloc_demo_project/ui/webview/bloc/webview_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

//This class contains the UI part for News Details.
class WebViewScreen extends StatefulWidget {
  String loadUrl;
  
  WebViewScreen({required this.loadUrl});
  
  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  //Initialize WebViewBloc class
  var webViewBloc = WebViewBloc();
  
  @override
  void initState() {
    super.initState();

    //Initialize webviewController
    webViewBloc.initWebView(url: widget.loadUrl);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: StringConstants.newsDetails),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: webViewBloc.isLoading,
                  builder: (context,snapshot){
                    if (snapshot.hasData) {
                      var isLoading = snapshot.data ?? false;
                      return isLoading ? commonLoaderWidget() : webViewWidget(buildContext: context);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return commonLoaderWidget();
                  },
                ),
              ),
            ],

          )
        ],
      ),
    );
  }

  //This function returns the webview ui.
  webViewWidget({required BuildContext buildContext}) {
    return webViewBloc.webViewController != null ? WebViewWidget(
      controller: webViewBloc.webViewController!,
    ) : SizedBox();
  }
}

