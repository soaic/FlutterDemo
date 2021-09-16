import 'package:flutter/material.dart';

class ButtonTest extends StatefulWidget {
  @override
  ButtonTestState createState() => new ButtonTestState();
}


class ButtonTestState extends State<ButtonTest> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Button Test"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: testPress,
          child: Text("test"),
        ),
//        child: FlatButton(
//          onPressed: testPress,
//          child: Text("test"),
//        ),
      ),
    );
  }


  void testPress() {
    showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            content: Text("I am alert dialog!"),
          );
        }
    );
  }

  void test() {

  }
}


