import 'package:flutter/material.dart';
import 'package:flutter_demo/test/page/sports_page.dart';
import 'package:flutter_demo/test/page/technology_page.dart';

import 'hot_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("HomePage页面");
    // TODO: implement createState
    return new _PageHomeState();
  }
}

class _PageHomeState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("测试"),
        leading: FlutterLogo(
          colors: Colors.amber,
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.share), onPressed: null)
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: '热门',
            ),
            Tab(
              text: '体育',
            ),
            Tab(
              text: '科技',
            ),
          ],
        ),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return new TabBarView(
      children: [
        HotPage(),
        SportPage(),
        TechnologyPage(),
      ],
      controller: _tabController,
    );
  }
}
