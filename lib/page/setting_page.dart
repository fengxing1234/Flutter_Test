import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
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
    return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return new Dismissible(
          key: Key(item),
          child: ListTile(
            leading: Icon(Icons.access_time),
            title: Text('${items[index]}'),
          ),
          onDismissed: (direction) {
            items.removeAt(index);
            print(index);
          },
        );
      },
    );
  }
}
