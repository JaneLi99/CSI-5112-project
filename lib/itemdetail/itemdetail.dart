import 'package:flutter/material.dart';

class Itemdetail extends StatelessWidget {
  const Itemdetail({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Details_Screen(),
    );
  }
}

class Details_Screen extends StatelessWidget {
  const Details_Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color.fromRGBO(248, 250, 255, 1), //设置appBar背景色
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
            onPressed: () {},
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.home_rounded)),
        ],
      ),
      body: BodySection(),
    );
  }
}

class BodySection extends StatelessWidget {
  const BodySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Image.asset('images/Juice.jpeg'),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Orange nfc probiotics',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '\$5.50',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                              ),
                              Text('1'),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Item Info :',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Text(
                      '100% Pure Orange juice not from concentrate, active probiotic culture (Bacillus subtilis DE111).',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'From LetsGocery',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        width: 200,
                        height: 60,
                        child: ElevatedButton(
                          child: Icon(
                            Icons.add_shopping_cart_outlined,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPrimary: Colors.black,
                              primary: Colors.orangeAccent),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            color: Colors.orangeAccent,
            child: buttonSection,
          ),
        ],
      ),
    );
  }
}

Container _buildButtonColumn(Color color, IconData icon, String label) {
  return Container(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: color,
          size: 30,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(Colors.white, Icons.ios_share, 'Share'),
    _buildButtonColumn(
        Colors.white, Icons.favorite_border_rounded, 'Favourite'),
    _buildButtonColumn(Colors.white, Icons.insert_comment, 'Comment')
  ],
);
