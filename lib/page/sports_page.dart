import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/utils.dart';

class SportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SportsPageState();
  }
}

class _SportsPageState extends State<SportPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      children: getImages(),
    );
  }

  List<Widget> getImages() {
    List<Widget> _images = new List();
    for (int i = 0; i < 1; i++) {
      _images.add(new Image.asset(Utils.getImagePath('guide_$i')));
    }
    return _images;
  }
}
