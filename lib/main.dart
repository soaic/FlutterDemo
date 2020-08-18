import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ui/page/home_page.dart';

void main() => runApp(
    MyApp()
);

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter_app",
      theme: new ThemeData.light(),
      initialRoute: "/",
      routes: {
        "/": (context) => new HomePage()
      }
    );
  }
}

//class MyApp extends StatelessWidget {
//  static const platformChannel =
//  const MethodChannel('com.example.platform_channel/dialog');//1
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "Flutter Demo",
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text("Flutter调用Android"),
//        ),
//        body: Padding(
//          padding: EdgeInsets.all(40.0),
//          child: RaisedButton(
//            child: Text("调用Dialog"),
//            onPressed: () {
//              showDialog("Flutter调用AlertDialog");
//            },
//          ),
//        ),
//      ),
//    );
//  }
//
//  void showDialog(String content) async {
//    var arguments = Map();
//      arguments['content'] = content;
//      try {
//        String result = await platformChannel.invokeMethod('dialog', arguments);//2
//        print('showDialog ' + result);
//      } on PlatformException catch (e) {
//        print('showDialog ' + e.code + e.message + e.details);
//      } on MissingPluginException catch (e) {
//        print('showDialog ' + e.message);
//    }
//  }
//}

