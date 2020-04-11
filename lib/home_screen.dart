import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Controller.dart';
import 'destination_carousel.dart';
import 'destination_screen.dart';
import 'models/destination.dart';
import 'tab_page.dart';
import 'top_menu.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  void jumpToPage(int selectedPage) {}

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  List<IconData> _icons = [
    FontAwesomeIcons.addressBook,
    FontAwesomeIcons.bus,
    FontAwesomeIcons.car,
    FontAwesomeIcons.biking
  ];

  @override
  void jumpToPage(int selectedPage) {
    pageController.jumpToPage(selectedPage);
  }

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          print(_selectedIndex);
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 38.0,
        ),
        child: Stack(children: <Widget>[
          Positioned(
            top: 55.0,
            left: MediaQuery.of(context).size.width / 6,
            child: Container(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              alignment: Alignment.bottomCenter,
              height: 70.0,
              width: 290.0,
              color: Colors.transparent,
              child: TopMenu(_selectedIndex, this),
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: MediaQuery.of(context).size.width / 6,
            child: Container(
              padding: EdgeInsets.only(top: 5.0, bottom: 1.0),
              alignment: Alignment.bottomCenter,
              height: 70.0,
              width: 290.0,
              color: Colors.transparent,
              child: TopMenu(_selectedIndex, this),
            ),
          ),
        ]),
      ),
      body: PageView.builder(
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
        controller: pageController,
        itemBuilder: (context, position) {
          return Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 730,
                  margin: const EdgeInsets.only(top: 90.0, bottom: 40.0),
                  color: Colors.transparent,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      ListView(
                        padding: EdgeInsets.only(top: 5.0, bottom: 20.0),
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          DestinationCarousel(Controller.noParams()),
                        ],
                      ),
//                      Positioned(
//                          bottom: 9.0, child: TabPage(_selectedIndex, this)
//                          ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      //bottomNavigationBar: TabPage(_selectedIndex, this),
    );
  }

  Widget topMenu() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _icons
            .asMap()
            .entries
            .map(
              (MapEntry map) => _buildIcon(map.key),
            )
            .toList(),
      ),
    );
  }
}
