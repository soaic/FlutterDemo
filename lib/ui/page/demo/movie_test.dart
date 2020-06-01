
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widget/web_scaffold.dart';
import 'package:flutter_app/utils/navigator_util.dart';

class MovieTest extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Test"),
      ),
      body: new Container(
        margin: new EdgeInsets.all(10),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new InkWell(
                child: Icon(Icons.movie,
                  color: Colors.blue,
                  size: 60,
                ),
                onTap: () =>
                    NavigatorUtil.pushWeb(context,
                        title: "Test",
                        url: "https://v.qq.com/",
                        userAgent: "Mozilla/5.0 (iPad; U; CPU OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5",
                        onWebViewListener: OnWebViewListener(
                            onPageStarted: (webViewController, url) {
                              print("url=============$url");
                              final baseUrl = "v.qq.com/x/cover";
                              if (url.indexOf(baseUrl) > 0) {
                                NavigatorUtil.pushWeb(context,
                                    title: "qq",
                                    url: "https://jx.yingxiangbao.cn/vip.php?url=" + url
                                );
                              }
                            }
                        )
                    )
            ),
            new InkWell(
                child: Icon(Icons.movie,
                  color: Colors.blue,
                  size: 60,
                ),
                onTap: () => NavigatorUtil.pushWeb(context,
                    title: "Test",
                    url: "https://www.iqiyi.com",
                    //userAgent: "Mozilla/5.0 (iPad; CPU OS 11_0 like Mac OS X) AppleWebKit/604.1.34 (KHTML, like Gecko) Version/11.0 Mobile/15A5341f Safari/604.1",
                    onWebViewListener: OnWebViewListener(
                        onPageStarted: (webViewController, url) {
                          print("url========$url");
                          final baseUrl = "iqiyi.com/v_";
                          if (url.indexOf(baseUrl) > 0) {
                            NavigatorUtil.pushWeb(context,
                                title: "iqy",
                                url: "https://jx.yingxiangbao.cn/vip.php?url=" + url
                            );
                          }
                        }
                    )
                )
            )
          ],
        ),
      ),
    );
  }

}