import 'package:flutter/material.dart';

class TechnologyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TechnologyPageState();
  }
}

class _TechnologyPageState extends State<TechnologyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
        child: Text('手势识别'),
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
          print('水平拖动'+details.toString());
        },
      ),
    );
  }
}
