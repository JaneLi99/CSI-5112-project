import 'package:flutter/material.dart';
import 'package:csi5112/Customer/CustomerInfo.dart';
import 'package:csi5112/Customer/CustomerOrder.dart';

class Customerhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80.0,
                      padding: EdgeInsets.only(top: 20.0),
                      child: const Text(
                        "Your Account",
                        textScaleFactor: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.blueGrey),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0))),
                    margin: const EdgeInsets.all(4.0),
                    child: Image.asset('assets/images/orders.png'),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CustomerOrder();
                    }));
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.blueGrey),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0))),
                    margin: const EdgeInsets.all(4.0),
                    child: Image.asset('assets/images/security.png'),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return CustomerInfo();
                    }));
                  },
                ),
              ),
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.blueGrey),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(8.0))),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('assets/images/prime.png'),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.blueGrey),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(8.0))),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('assets/images/favorite.png'),
                ),
              ),
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.blueGrey),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(8.0))),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('assets/images/payment.png'),
                ),
              ),
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.blueGrey),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(8.0))),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('assets/images/coupon.png'),
                ),
              ),
            ],
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Homepage',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(214, 50, 58, 65),
      ),
      body: container,
    );
  }
}
