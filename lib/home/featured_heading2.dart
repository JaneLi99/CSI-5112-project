import 'package:csi5112/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedHeading2 extends StatelessWidget {
  const FeaturedHeading2({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.1,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(),
                InkWell(
                    onTap: () {},
                    splashColor: Color.fromARGB(26, 245, 242, 242),
                    child: (const Text(
                      'Fresh Fruit',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ))),
                const SizedBox(height: 5),
                Text(
                  'Refresh and be healthy',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
                const SizedBox(height: 10),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {},
                    splashColor: Color.fromARGB(26, 245, 242, 242),
                    child: (const Text(
                      'Fresh Fruit',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ))),
                const Expanded(
                  child: Text(
                    'Refresh and be healthy',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
