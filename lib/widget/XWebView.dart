import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class XWebView extends StatefulWidget {
  final title;
  final url;

  XWebView({
    Key key,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return XWebViewState();
  }
}

class XWebViewState extends State<XWebView> {
  bool isLoad = true;
  final flutterWebView = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    flutterWebView.onStateChanged.listen((state) {
      if (state.type == WebViewState.finishLoad) {
        // 加载完成
        setState(() {
          isLoad = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoad = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
          title: Text(widget.title),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: isLoad
                ? LinearProgressIndicator()
                : Divider(height: 1, color: Theme.of(context).primaryColor),
          )),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
