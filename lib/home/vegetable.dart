import 'package:csi5112/itemdetail/itemdetails.dart';
import 'package:csi5112/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Vegetable extends StatelessWidget {
  const Vegetable({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(
                top: screenSize.height / 50,
                left: screenSize.width / 15,
                right: screenSize.width / 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 4.5,
                        width: screenSize.width / 4.5,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                                onTap: () {},
                                splashColor: Colors.white10,
                                child: Ink.image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    image: const AssetImage(
                                        'assets/images/broccoli.png')))),
                      ),
                      Text(
                        'Broccoli',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 4.5,
                        width: screenSize.width / 4.5,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                                onTap: () {},
                                splashColor: Colors.white10,
                                child: Ink.image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    image: const AssetImage(
                                        'assets/images/tomato.png')))),
                      ),
                      Text(
                        'Tomato',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 4.5,
                        width: screenSize.width / 4.5,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                                onTap: () {},
                                splashColor: Colors.white10,
                                child: Ink.image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    image: const AssetImage(
                                        'assets/images/potato.png')))),
                      ),
                      Text(
                        'Potato',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 4.5,
                        width: screenSize.width / 4.5,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                                onTap: () {},
                                splashColor: Colors.white10,
                                child: Ink.image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    image: const AssetImage(
                                        'assets/images/onion.png')))),
                      ),
                      Text(
                        'Onion',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 4.5,
                        width: screenSize.width / 4.5,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                                onTap: () {},
                                splashColor: Colors.white10,
                                child: Ink.image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    image: const AssetImage(
                                        'assets/images/ginger.png')))),
                      ),
                      Text(
                        'Ginger',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 6,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ItemDetails()));
                                },
                                splashColor: Colors.white10,
                                child: Ink.image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    image: const AssetImage(
                                        'assets/images/broccoli.png')))),
                      ),
                      Text(
                        'Broccoli',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 6,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                                onTap: () {},
                                splashColor: Colors.white10,
                                child: Ink.image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    image: const AssetImage(
                                        'assets/images/tomato.png')))),
                      ),
                      Text(
                        'Tomato',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 6,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                                onTap: () {},
                                splashColor: Colors.white10,
                                child: Ink.image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    image: const AssetImage(
                                        'assets/images/potato.png')))),
                      ),
                      Text(
                        'Potato',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 6,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                                onTap: () {},
                                splashColor: Colors.white10,
                                child: Ink.image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    image: const AssetImage(
                                        'assets/images/onion.png')))),
                      ),
                      Text(
                        'Onion',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 6,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                                onTap: () {},
                                splashColor: Colors.white10,
                                child: Ink.image(
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                    image: const AssetImage(
                                        'assets/images/ginger.png')))),
                      ),
                      Text(
                        'Ginger',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
