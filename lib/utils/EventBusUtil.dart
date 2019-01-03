import 'package:event_bus/event_bus.dart';

///发送EventBusUtil.eventBus.fire(DemoEvent());
///接收EventBusUtil.eventBus.on<DemoEvent>().listen((event) {  });
class EventBusUtil {
  static EventBus eventBus = new EventBus();
}