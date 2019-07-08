import 'package:flutter/services.dart';

const String Channel_counter = "com.zhyen.flutter_demo/counter_channel";

class NativeCount {
  static const counterPlugin = const EventChannel(Channel_counter);

  void registerCounter() {
    counterPlugin.receiveBroadcastStream().listen(_onEvent, onError: _onError,
        onDone: () {
      print('onDone');
    });
  }

  void _onEvent(Object event) {
    print(event);
    print('成功');
  }

  void _onError(Object error) {
    print(error);
    print('计时器异常');
  }
}
