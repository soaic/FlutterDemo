import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {

  String textValue;

  Widget buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    controller.addListener(() {
       textValue = controller.text;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: buildTextField(controller),
          ),
          RaisedButton(
            child: Text("send"),
            onPressed: onPress
          )
        ],
    ));
  }

  void onPress(){
    print(textValue);
  }
}

