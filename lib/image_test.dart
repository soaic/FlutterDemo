import 'package:flutter/material.dart';

class ImageTest extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Test"),
      ),
      body: Image.network(
          'https://www.baidu.com/img/dong_6b43e987ca87c26dd0ad5fc0ebffb871.gif'
      ),
    );
  }

}

