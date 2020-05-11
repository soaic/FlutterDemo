import 'package:flutter/material.dart';
import 'package:flutter_app/ui/page/demo/button_test.dart';
import 'package:flutter_app/ui/page/demo/list_view_test.dart';
import 'package:flutter_app/ui/page/demo/hello_flutter.dart';

class NavigationBarTest extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return NavigationBarState();
  }

}

class NavigationBarState extends State<NavigationBarTest> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Startup Name Generator',
      color: Colors.orange,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            BuildingListView(),
            ButtonTest(),
            MyHomePage(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
              controller: controller,
              labelColor: Colors.deepPurpleAccent,
              unselectedLabelColor: Colors.black26,
              indicatorColor: Colors.transparent,
              isScrollable: false,   //是否能滑动
              tabs: <Widget>[
                new Tab(
                  text: "列表",
                  icon: new Icon(Icons.brightness_5),
                ),
                new Tab(
                  text: "按钮",
                  icon: new Icon(Icons.map),
                ),
                new Tab(
                  text: "开始",
                  icon: new Icon(Icons.directions_run),
                ),
              ]
          ),
        ),
      ),
    );
  }

}