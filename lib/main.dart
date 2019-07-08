import 'dart:io';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/test/page/splash_page.dart';

void main() {
  runApp(MyApp());
  //状态栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '练习项目',
      home: SplashPage(),
      theme: ThemeData(
          //主页
          primaryColor: BaseColors.app_main,
          scaffoldBackgroundColor: BaseColors.bg_color),
      //onGenerateRoute:, //onGenerateRoute（生成路由）
    );
  }
}
