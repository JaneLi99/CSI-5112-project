import 'package:flutter/material.dart';
import 'itemdetails.dart';
import 'body_section.dart';
import 'package:csi5112/home/user_homepage.dart';

class Details_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(212, 50, 58, 65), //设置appBar背景色
        title: Text(
          'Product Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // 居中显示
        leading: Container(
          // 绘制返回键
          margin: EdgeInsets.all(10), // 设置边距
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(1, 2), // 阴影起始位置
                blurRadius: 5, // 阴影面积
                color: Colors.grey.withOpacity(.4), // 阴影透明度
              )
            ],
            color: Colors.white, // Container背景色
            borderRadius: BorderRadius.all(
              Radius.circular(100.0), // Container设置为圆形
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => userHomePage(),
                ),
              );
            },
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      body: BodySection(),
    );
  }
}
