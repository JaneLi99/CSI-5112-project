import 'package:csi5112/models/order.dart';
import 'package:csi5112/login/login_page.dart' as loginPage;
import 'package:flutter/material.dart';

import '../httprequest/get_data.dart';
import '../models/user.dart';

// var OrderList = OrderListModel.orders;

List<OrderModel> localOrders = [];
List<OrderModel> userOrders = [];

class CustomerOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomerOrdersState();
  }
}

class CustomerOrdersState extends State<CustomerOrders> {
  late Future<List<OrderModel>> orders;

  UserModel currentUser = loginPage.currentUser;

  @override
  void initState() {
    super.initState();
    orders = HttpGet.fetchOrders();
  }

  var headingTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22.0,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrderModel>>(
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return const CircularProgressIndicator();
        }

        localOrders = [...snapshot.data as List<OrderModel>];

        if (userOrders.length != 0) {
          userOrders.clear();
        }

        for (int i = 0; i < localOrders.length; i++) {
          if (localOrders[i].userId == currentUser.userName) {
            userOrders.add(localOrders[i]);
          }
        }
        return ListView(shrinkWrap: true, children: [
          Container(
            height: 1200,
            alignment: Alignment.center,
            color: Colors.yellow[50],
            child: Container(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Orders Here",
                          style: headingTextStyle,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16.0),
                      height: 1.0,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 32.0),
                    Table(
                      columnWidths: const {
                        0: FixedColumnWidth(120.0),
                        1: FixedColumnWidth(120.0),
                        2: FixedColumnWidth(100.0),
                        3: FixedColumnWidth(200.0),
                        4: FixedColumnWidth(100.0),
                      },
                      border: TableBorder.all(
                        color: Colors.black,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                      children: [
                        TableRow(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            children: [
                              SizedBox(
                                height: 30.0,
                                child: Text(
                                  'Order ID',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                'Order Date',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Total Price',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Order Address',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Print Invoice',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                        for (int i = 0; i < userOrders.length; i++)
                          OrderColumn(userOrders[i]),
                      ],
                    ),
                  ],
                )),
          )
        ]);
      },
      future: orders,
    );
  }

  TableRow OrderColumn(OrderModel orderModel) {
    List<String> products = [];
    List<String> unitPrice = [];
    List<String> quantities = [];
    String orderDetails = "";

    products = orderModel.products.split(',');
    unitPrice = orderModel.unitPrice.split(',');
    quantities = orderModel.quantities.split(',');

    for (int j = 0; j < products.length - 1; j++) {
      String s =
          products[j] + " * " + quantities[j] + " @ " + unitPrice[j] + "\n";
      orderDetails = orderDetails + s;
    }

    return TableRow(children: [
      Container(
        height: 40,
        child: Align(
          child: Text(
            "${orderModel.orderId}",
            textAlign: TextAlign.center,
            // style: TextStyle(height: 20),
          ),
        ),
      ),
      Container(
        height: 60,
        child: Align(
          child: Text(
            "${orderModel.orderDate}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        height: 40,
        child: Align(
          child: Text(
            "${orderModel.totalPrice}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        height: 40,
        child: Align(
          child: Text(
            "${orderModel.orderAddress}",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
        height: 40,
        child: Align(
          child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title:
                              Text("Your invoice \n# ${orderModel.orderId}:"),
                          content: Text(
                              "User Name: \n${orderModel.userId}\n\nOrder Time: \n${orderModel.orderDate}\n\nProducts: \n$orderDetails\n\nTotalPrice: \n${orderModel.totalPrice}\n"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ));
              },
              child: Text("Print Invoice")),
        ),
      ),
    ]);
  }
}
