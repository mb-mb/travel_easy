import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class TabPage extends StatefulWidget {
  int _selectedIndex;
  MyHomePageState controller;

  TabPage(int selectedIndex, MyHomePageState controller) {
    this._selectedIndex = selectedIndex;
    this.controller = controller;
  }
  @override
  State<StatefulWidget> createState() =>
      _TabPageState(this._selectedIndex, this.controller);
}

class _TabPageState extends State<TabPage> {
  List<GButton> tabs = new List();
  double gap = 30.0;
  int _selectedIndex;
  MyHomePageState controller;

  _TabPageState(int selectedIndex, MyHomePageState controller) {
    this._selectedIndex = selectedIndex;
    this.controller = controller;
  }

//  FontAwesomeIcons.addressBook,
//  FontAwesomeIcons.bus,
//  FontAwesomeIcons.car,
//  FontAwesomeIcons.biking

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tabs = List();
    tabs.add(GButton(
      gap: gap,
      padding: EdgeInsets.all(5),
      iconActiveColor: Colors.lightBlue,
      iconColor: Colors.black12,
      textColor: Colors.lightBlue,
      color: Colors.lightBlue.shade100,
      iconSize: 24,
      icon: FontAwesomeIcons.addressBook,
      text: 'Onde ir ? ',
    ));

    tabs.add(GButton(
      gap: gap,
      padding: EdgeInsets.all(5),
      iconActiveColor: Colors.lightBlue,
      iconColor: Colors.black12,
      textColor: Colors.lightBlue,
      color: Colors.lightBlue.shade100,
      iconSize: 24,
      icon: FontAwesomeIcons.bus,
      text: 'onibus',
    ));

    tabs.add(GButton(
      gap: gap,
      padding: EdgeInsets.all(5),
      iconActiveColor: Colors.lightBlue,
      iconColor: Colors.black12,
      textColor: Colors.lightBlue,
      color: Colors.lightBlue.shade100,
      iconSize: 24,
      icon: FontAwesomeIcons.car,
      text: 'carro',
    ));

    tabs.add(GButton(
      gap: gap,
      padding: EdgeInsets.all(5),
      iconActiveColor: Colors.lightBlue,
      iconColor: Colors.black12,
      textColor: Colors.lightBlue,
      color: Colors.lightBlue.shade100,
      iconSize: 24,
      icon: FontAwesomeIcons.biking,
      text: 'bike',
    ));

    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.symmetric(horizontal: 100),
      height: 60.0,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(90)),
          boxShadow: [
            BoxShadow(
                spreadRadius: -20,
                blurRadius: 90,
                color: Colors.black.withOpacity(.20),
                offset: Offset(0, 15)),
          ]),
      child: GNav(
        tabs: tabs,
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
          controller.jumpToPage(index);
        },
      ),
    );
  }
}
