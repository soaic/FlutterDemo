
import 'package:flutter/cupertino.dart';

/// 定义一个name的共享组件
class NameInheritedWidget extends InheritedWidget {
  /// 共享状态
  final String name;
  /// 修改共享状态方法
  final Function onNameChange;

  NameInheritedWidget({Key key, Widget child, @required this.name, @required this.onNameChange})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(NameInheritedWidget oldWidget) {
    return name != oldWidget.name;
  }

}