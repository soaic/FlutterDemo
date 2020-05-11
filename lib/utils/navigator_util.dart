import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ui/widget/web_scaffold.dart';
import 'package:flutter_app/utils/object_util.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigatorUtil {
  static void pushPage(
    BuildContext context,
    Widget page, {
    String pageName,
    bool needLogin = false,
  }) {
    if (context == null || page == null) return;
    Navigator.push(
        context, new CupertinoPageRoute<void>(builder: (ctx) => page));
  }

  static void pushWeb(BuildContext context,
      { String title, String url, String userAgent, OnWebViewListener onWebViewListener}) {
    if (context == null || ObjectUtil.isEmpty(url)) return;
    if (url.endsWith(".apk")) {
      launchInBrowser(url, title: title);
    } else {
      Navigator.push(context, new CupertinoPageRoute<void>(
          builder: (ctx) =>
          new WebScaffold(
              title: title,
              url: url,
              userAgent: userAgent,
              onWebViewListener: onWebViewListener
          ))
      );
    }
  }


  static Future<Null> launchInBrowser(String url, {String title}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
