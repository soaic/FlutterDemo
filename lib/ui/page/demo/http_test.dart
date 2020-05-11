import 'package:flutter_app/ui/widget/loding_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/net/http_utils.dart';

class HttpTest extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() => HttpTestState();
  
}

class HttpTestState extends State<HttpTest>{
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Test"),
      ),
      body: Center(
        child: RaisedButton(onPressed: onPressed, child: Text("http request")),
      ),
    );
  }
  
  void onPressed() {
    LoadingDialog.show(context, "加载中...");
    getData( (data) {
      print(data);
      LoadingDialog.dismiss(context);
    });
  }

}

getData(cbk) async {
  var api = 'http://www.toly1994.com:8089/api/android/note/100';
  XNetClientBuilder()
      .url(api)
      .method(XNetClientBuilder.GET)
      .onSuccess((code, data, msg) { cbk(data); })
      .onFailure((code, msg) { cbk(msg); }).build()
      .request();



}

postData(cbk) async {
  var api = 'http://www.toly1994.com:8089/api/android/note';
  var item = {
    "type": "C",
    "name": "插入测试",
    "localPath": "null",
    "jianshuUrl": "https://www.jianshu.com/p/12f8ab32591a",
    "juejinUrl": "null",
    "imgUrl":
    "http://toly1994.com:8089/imgs/android/c3af376135a7abe0655c908195b271db.png",
    "createTime": "2018-09-06",
    "info": "null",
    "area": "A"
  };

  XNetClientBuilder()
      .url(api)
      .method(XNetClientBuilder.POST)
      .paramBody(item)
      .onSuccess((code, data, msg) { cbk(data); })
      .onFailure((code, msg) { cbk(msg); })
      .request();

}