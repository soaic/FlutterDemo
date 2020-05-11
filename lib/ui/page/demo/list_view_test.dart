import 'package:flutter/material.dart';
import 'package:flutter_app/ui/page/demo/container_test.dart';
import 'package:flutter_app/ui/page/demo/http_test.dart';
import 'package:flutter_app/ui/page/demo/image_test.dart';
import 'package:flutter_app/ui/page/demo/button_test.dart';
import 'package:flutter_app/ui/page/demo/hello_flutter.dart';
import 'package:flutter_app/ui/page/demo/text_field_test.dart';
import 'package:flutter_app/ui/widget/web_scaffold.dart';

class BuildingListView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => BuildingListViewState();

}

void itemClick(BuildContext context, int index, String content){
  debugPrint(content);
  Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => getPage(index))
  );
}

Widget getPage(int index){
  switch(index){
    case 0:
      return ButtonTest();
    case 1:
      return ContainerTest();
    case 2:
      return MyHomePage();
    case 3:
      return ImageTest();
    case 4:
      return TextFieldPage();
    case 5:
      return HttpTest();
    case 6:
      return WebScaffold(title: "Test", url: "https://flutter.io/");
    default:
      return MyHomePage();
  }
}

class BuildingListViewState extends State<BuildingListView> {
  List<String> data = <String>[];
  OnItemClickListener listener;
  ScrollController _scrollController = ScrollController(); //ListView的控制器
  bool isLoading = false;
  int _page = 1;

  BuildingListViewState(){
    initData();
    listener = (cxt, index, content) => itemClick(cxt, index, content);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_getMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: data.length * 2,
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(height: 1); /*2 奇数显示分割线*/
          final index = i ~/ 2; /*3*/
          return ItemView(index, data[index], listener);
        },
        controller: _scrollController,
      ),
      onRefresh: _onRefresh,
    );
  }

  //下拉刷新
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('下拉刷新');
      setState(() {
        initData();
      });
    });
  }

  //加载更多
  Future _getMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        print('加载更多');
        setState(() {
          data.addAll(List.generate(5, (i) => '第$_page次上拉来的数据'));
          _page++;
          isLoading = false;
        });
      });
    }
  }

  void initData(){
    data.clear();
    data.add("Button");
    data.add("Container");
    data.add("HelloFlutter");
    data.add("Image");
    data.add("TextField");
    data.add("HttpTest");
    data.add("WebViewTest");
    data.addAll(List.generate(20, (i) => '第$_page次上拉来的数据'));
  }
}



// 定义一个回调接口
typedef OnItemClickListener = void Function(BuildContext context, int position, String content);

class ItemView extends StatelessWidget{

  final int position;
  final String content;
  final OnItemClickListener listener;

  ItemView(this.position, this.content, this.listener);

  @override
  Widget build(BuildContext context) {
    final widget = Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            child: Icon(
                Icons.restaurant, color: Colors.blue[500],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(content, style: TextStyle(fontSize: 16),),
                Text(content + position.toString()),
              ],
            ),
          )
        ],
    );
    // 水波纹效果，使用的是 InkWell。
    return InkWell(
        onTap: () => listener(context, position, content),
        child: widget
    );
  }

}