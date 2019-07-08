import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/utils.dart';

class GuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _GuidePageState();
  }
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      children: getImages(),
      onPageChanged: (index) {
        print(index);
      },
    );
  }

  List<Widget> getImages() {
    List<Widget> _images = new List();
    for (int i = 0; i < 4; i++) {
      _images.add(new Image.asset(Utils.getImagePath('guide_$i')));
    }
    return _images;
  }
}
