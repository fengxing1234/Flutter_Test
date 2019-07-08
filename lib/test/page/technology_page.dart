import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TechnologyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TechnologyPageState();
  }
}

class _TechnologyPageState extends State<TechnologyPage> {
  static const counterPlugin = const EventChannel('com.zhyen.flutter_demo/counter_channel');

  StreamSubscription _subscription;
  var _count = "点击开始计时";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(_subscription);
    if (_subscription == null) {
      print('计时');
      _subscription = counterPlugin
          .receiveBroadcastStream()
          .listen(_onEvent, onError: _onError);
    }
  }

  void _onEvent(Object event) {
    setState(() {
      _count = event;
      print("ChannelPage: $event");
    });
  }

  void _onError(Object error) {
    setState(() {
      _count = "计时器异常";
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
        child: Text(_count),
        onTap: () {
          print('onTap');
        },
        onDoubleTap: () {
          print('onDoubleTap');
        },
        onLongPress: () {
          print('长按');
        },
        onHorizontalDragStart: (details) {
          print('水平拖动' + details.toString());
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //取消监听
    if (_subscription != null) {
      _subscription.cancel();
    }
  }
}
