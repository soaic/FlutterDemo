import 'package:flutter/material.dart';

class ContainerTest extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Test"),
      ),
      body: Container(
        child: Center(
            child: Text('test')
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
        ),
      ),
    );
  }
}