
import 'dart:math';

import 'package:flutter/cupertino.dart';

/// 随机名字游戏页面
class NameGamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NameGameState();
  }

}

/// 随机游戏名字状态
class NameGameState extends State<NameGamePage> {
  /// 随机名字
  String name;

  /// 改变随机名字
  void changeName() {
    List<String> nameList = ['flutter','dart', 'android'];
    int pos = Random().nextInt(3);
    setState(() {
      name = nameList[pos];
    });
  }

  @override
  void initState() {
    setState(() {
      name = 'flutter';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

      ],
    );
  }

}