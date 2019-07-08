import 'package:flutter/material.dart';
import 'package:flutter_demo/test/page/contacts_page.dart';
import 'package:flutter_demo/test/page/home_page.dart';
import 'package:flutter_demo/test/page/setting_page.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TestPageState();
  }
}

class _TestPageState extends State<TestPage> {
  int _selectedIndex = 0;

  static List<Widget> _list = <Widget>[
    HomePage(),
    ContactsPage(),
    SettingPage(),
  ];

  get _drawer => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("冯星"),
              accountEmail: Text('www.zhyen.com'),
              currentAccountPicture: CircleAvatar(
                child: Text("X"),
              ),
            ),
            ListTile(
              title: Text('邮件'),
              leading: Icon(Icons.email),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: _getBottomItemList(),
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, //2
      ),
      drawer: _drawer,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _getBottomItemList() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('首页'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.contacts),
        title: Text('通讯录'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.build),
        title: Text('设置'),
      ),
    ];
  }

  Widget _getBody() {
    Widget widget = _list.elementAt(_selectedIndex);
    return widget;
  }
}
