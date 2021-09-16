import 'dart:async';
import 'dart:isolate';
Isolate isolate;
String name = 'dart';
void main() {
  testProject();
}

void isolateServer() async{
  final receive = ReceivePort();
  isolate = await Isolate.spawn(changeName, receive.sendPort);

  receive.listen((message) {
    print("My message is $message");
    print("My name is $name");
  });

}

void changeName(SendPort port) {
  name = 'dart isolate';
  port.send(name);
  print("My name is $name in isolate");
}


void testProject() {
  print("start project");

  ctask();

  for(int i=0;i<1000000000;i++) {

  }


  scheduleMicrotask((){
    scheduleMicrotask(() {
      print("h1-1 task");
    });

    Timer.run(() {
      print("l1-1 task");
    });
    print("H1 task complete");
  });

  scheduleMicrotask((){
    scheduleMicrotask(() {
      print("h2-1 task");
    });

    Timer.run(() {
      print("l2-1 task");
    });
    print("H2 task complete");
  });

  Timer.run(() {
    scheduleMicrotask((){
      print("h3-1 task");
    });
    Timer.run(() {
      print("l3-1 task");
    });
    print("L3 task complete");
  });

  Timer.run(() {
    scheduleMicrotask((){
      print("h4-1 task");
    });
    Timer.run(() {
      print("l4-1 task");
    });
    print("L4 task complete");
  });
}

void ctask() async {
  final receive = ReceivePort();
  isolate = await Isolate.spawn(doCtask, receive.sendPort);
  receive.listen((message) {
    print(message);
  });
}

void doCtask(SendPort port) {
  scheduleMicrotask(() {
    print("ch5-1 task");
  });
  Timer.run(() {
    print("cl5-1 task");
  });
  port.send("c1 task complete");
}