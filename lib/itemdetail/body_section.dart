import 'package:csi5112/shopping_cart/shopping_cart_page.dart';
import 'package:flutter/material.dart';

class BodySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Image.asset('assets/images/Coke.jpg'),
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
                    const Text(
                      'Coca-Cola Original',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          '\$1.99',
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
                                  icon: const Icon(Icons.remove),
                                ),
                              ),
                              const Text('1'),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'Item Info :',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    const Text(
                      'For over 130 years, the world has been enjoying the refreshing taste of Coca-Cola. It is one of the best-known products in the world and continues to inspire moments of happiness every single day.',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'From Coca-Cola Canada',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        width: 200,
                        height: 60,
                        child: ElevatedButton(
                          child: const Icon(
                            Icons.add_shopping_cart_outlined,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPrimary: Colors.white,
                            primary: const Color.fromARGB(212, 50, 58, 65),
                          ),
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
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey, // background
                  ),
                  onPressed: () {},
                  child: _buildButtonColumn(
                      Colors.white, Icons.ios_share, 'Share'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey, // background
                  ),
                  onPressed: () {},
                  child: _buildButtonColumn(Colors.white,
                      Icons.favorite_border_outlined, 'Favourite'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey, // background
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Shoppingcart(),
                      ),
                    );
                  },
                  child: _buildButtonColumn(
                      Colors.white, Icons.shopping_cart_rounded, 'MyCart'),
                ),
              ],
            ),
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
            style: const TextStyle(
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
/*
Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(212, 50, 58, 65)),
      child: _buildButtonColumn(Colors.white, Icons.ios_share, 'Share'),
    ),
    ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(212, 50, 58, 65)),
      child: _buildButtonColumn(
          Colors.white, Icons.favorite_border_rounded, 'Favourite'),
    ),
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Shoppingcart(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(212, 50, 58, 65)),
      child: _buildButtonColumn(
          Colors.white, Icons.shopping_cart_rounded, 'MyCart'),
    ),
  ],
);
*/