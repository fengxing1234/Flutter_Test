import 'package:flutter/material.dart';
import 'package:flutter_demo/test/test1.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSplash();
  }

  void _initSplash() {
    Observable.just(1).delay(Duration(milliseconds: 2000)).listen((event) {
      print("event:" + event.toString());
      _initAsync();
    });
  }

  void _initAsync(){
    print("页面跳转");
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => TestPage()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Image.asset(Utils.getImagePath("start_page", format: "jpg"));
  }
}
