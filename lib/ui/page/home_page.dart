import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widget/widgets.dart';
import 'package:flutter_app/utils/log_util.dart';
import 'package:flutter_app/utils/object_util.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new HomePageState();

}

class HomePageState extends State<HomePage> {

  Widget buildBanner(BuildContext context, List<String> list) {
    if (ObjectUtil.isEmpty(list)) {
      return new Container(height: 0.0);
    }
    return new AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Swiper(
        indicatorAlignment: AlignmentDirectional.bottomEnd,
        circular: true,
        interval: const Duration(seconds: 5),
        indicator: CircleSwiperIndicator(),
        children: list.map((url) {
          return new InkWell(
            onTap: () {
              LogUtil.e("BannerUrl: " + url.toString());
            },
            child: new CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: url,
              placeholder: (context, url) => new ProgressView(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> data = new List<String>();
    data.add("https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png");
    data.add("https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png");

    return new Material(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildBanner(context, data),

        ],
      ),
    );
  }

}

class NumberSwiperIndicator extends SwiperIndicator {
  @override
  Widget build(BuildContext context, int index, int itemCount) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.only(top: 10.0, right: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Text("${++index}/$itemCount",
          style: TextStyle(color: Colors.white70, fontSize: 11.0)),
    );
  }
}