import 'package:flutter/material.dart';
import 'package:flutter_demo/test/model/pet_card_view_model.dart';
import 'package:flutter_demo/utils/utils.dart';

class PetCard extends StatelessWidget {
  final PetCardViewModel data;

  const PetCard(this.data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, //设置背景颜色.
        borderRadius: BorderRadius.circular(8), //圆角
        boxShadow: <BoxShadow>[
          //阴影
          BoxShadow(
            color: Color.fromARGB(20, 0, 0, 0), //阴影默认颜色
            blurRadius: 6, //延伸距离,会有模糊效果 高斯的标准偏差与盒子的形状卷积。
            spreadRadius: 4, //延伸距离,不会有模糊效果 在应用模糊之前，框应该膨胀的量
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          this.renderCover(),
          this.renderUserInfo(),
          this.renderInteractionArea(),
          this.renderPublishContent(),
        ],
      ),
    );
  }

  renderCover() {
    return Stack(
      //alignment:, //alignment 子Widgets们的对齐方式
      //overflow:, //子Widgets溢出的处理方式
      //textDirection:, //textDirection 文本的方向，默认当然是 left-to-right
      fit: StackFit.passthrough, //fit 子Widgets的放置方式，默认loose
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          child: Image.asset(
            Utils.getImagePath('pet_img', format: 'jpg'),
            height: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          left: 0,
          top: 100,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Color.fromARGB(0, 0, 0, 0),
              Color.fromARGB(80, 0, 0, 0),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
        ),
      ],
    );
  }

  renderUserInfo() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFCCCCCC),
                backgroundImage: NetworkImage(
                    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1699287406,228622974&fm=26&gp=0.jpg"),
              ),
              Padding(padding: EdgeInsets.only(left: 8)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '大米要煮小米粥',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                  ),
                  Text(
                    '小米 | 我家的小仓鼠',
                    style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
                  )
                ],
              ),
            ],
          ),
          Text(
            '12:29',
            style: TextStyle(fontSize: 13, color: Color(0xFF999999)),
          ),
        ],
      ),
    );
  }

  renderPublishContent() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.message,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6),
              ),
              Text(
                '356',
                style: TextStyle(fontSize: 15, color: Color(0xFF999999)),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6),
              ),
              Text(
                '258',
                style: TextStyle(fontSize: 15, color: Color(0xff999999)),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.share,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6),
              ),
              Text(
                '110',
                style: TextStyle(fontSize: 15, color: Color(0xff999999)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  renderInteractionArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 14),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
                color: Color(0xFFFFC600),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
            child: Text('萌宠小屋'),
          ),
          Text(
            '今天带着小VIVI去了爪子生活体验馆，好多好玩的小东西都想带回家！',
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}
