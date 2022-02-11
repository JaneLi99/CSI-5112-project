import 'package:flutter/material.dart';
import 'package:csi5112/widgets/responsive.dart';
import 'package:csi5112/home/web_scrollbar.dart';
import 'package:csi5112/widgets/bottom_bar.dart';
import 'package:csi5112/widgets/user_topbar.dart';
import 'package:csi5112/home/featured_heading.dart';
import 'package:csi5112/home/featured_tiles.dart';
import 'package:csi5112/home/featured_heading2.dart';
import 'package:csi5112/home/featured_heading3.dart';
import 'package:csi5112/home/featured_tiles2.dart';
import 'package:csi5112/home/featured_tiles3.dart';

class userHomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _userHomePageState createState() => _userHomePageState();
}

class _userHomePageState extends State<userHomePage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 221, 156),
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: const Color.fromARGB(212, 50, 58, 65),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                ),
              ],
              title: const Text(
                'LetsGrocery',
                style: TextStyle(
                  color: Color.fromARGB(255, 207, 223, 230),
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: uTopBarContents(_opacity),
            ),
      //drawer: ExploreDrawer(),
      body: WebScrollbar(
        color: Color.fromARGB(230, 46, 55, 59),
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.45,
                    width: screenSize.width,
                    child: Ink.image(
                      fit: BoxFit.cover,
                      image: const AssetImage('assets/images/grocerycover.png'),
                    ),
                  ),
                  Column(
                    children: [
                      //FloatingQuickAccessBar(screenSize: screenSize),
                      Column(
                        children: [
                          FeaturedHeading(
                            screenSize: screenSize,
                          ),
                          FeaturedTiles(screenSize: screenSize),
                          FeaturedHeading2(
                            screenSize: screenSize,
                          ),
                          FeaturedTiles2(screenSize: screenSize),
                          FeaturedHeading3(
                            screenSize: screenSize,
                          ),
                          FeaturedTiles3(screenSize: screenSize)
                        ],
                      ),
                    ],
                  )
                ],
              ),
              //DestinationHeading(screenSize: screenSize),
              //DestinationCarousel(),
              SizedBox(height: screenSize.height / 10),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
