import 'package:flutter/material.dart';

class HotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HotPageState();
  }
}

class _HotPageState extends State<HotPage> {
  List<String> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    items = new List<String>.generate(300, (i) => "第$i行");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.access_time),
          title: Text('${items[index]}'),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          constraints: BoxConstraints.tightFor(height: 1),
          color: Colors.black45,
        );
      },
    );
  }
}
