import 'package:flutter/services.dart';

class NativeToast {
  static const Native_Method = 'showToast';
  static const Native_Channel_Name = 'com.zhyen.flutter_demo/toast';

  static const platform = const MethodChannel(Native_Channel_Name);

  Future<Null> showToast(String message) async {
    Map<String, String> map = {"msg": message, "time": "0"};
    try {
      String result = await platform.invokeMethod(Native_Method,map);
      print(result);
    } on PlatformException catch (e) {
      print("错误" + e.toString());
    }
  }
}
