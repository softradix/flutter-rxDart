import 'package:bloc_demo_project/common/theme/app_color_palette.dart';
import 'package:bloc_demo_project/models/news_response_model.dart';
import 'package:bloc_demo_project/ui/news_listing/screen/news_listing_screen.dart';
import 'package:bloc_demo_project/ui/webview/screen/webview_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

/*
This class extends the NewsApiListingScreen class.
All the properties of NewsApiListingScreen are accessible to this extension.
Extension is the way to add functionalities to existing class.
*/
extension NewsListingScreenExtension on NewsApiListingScreen{

  Widget buildList(AsyncSnapshot<NewsResponseModel> snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
      child: ListView.separated(
        itemCount: snapshot.data?.articles?.length ?? 0,
        separatorBuilder: (context, index) {
          return Divider(
            color: lightColorPalette.blackColorPrimary.shade800
          );
        },
        itemBuilder: (context, index) {
          return listItemWidget(
              index: index, articles: snapshot.data?.articles ?? [],context: context);
        },
      ),
    );
  }

  listItemWidget({required int index, required List<Articles> articles,required BuildContext context}) {
    var rowData = articles[index];

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  WebViewScreen(loadUrl: rowData.url ?? "",)
        ));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  color: lightColorPalette.primarySwatch.shade900),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl: '${rowData.urlToImage ?? ""}',
                    height: 50.h,
                    fit: BoxFit.fill,
                    width: 50.w,
                    placeholder: (context, url) => Container(
                        child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: shimmerCard())),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${rowData.title ?? ""}',
                    style:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  Text("By ${rowData.author ?? ""}",
                      style:
                      TextStyle(fontSize: 14.sp,
                          color: lightColorPalette.blackColorPrimary.shade800,
                          fontWeight: FontWeight.normal)
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    "${rowData.content ?? ""}",
                    style:
                    TextStyle(fontSize: 14.sp,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget shimmerCard() {
    return Container(
      color: lightColorPalette.whiteColorPrimary.shade900,
      height: 50.h,
      width: 50.w,
    );
  }
}