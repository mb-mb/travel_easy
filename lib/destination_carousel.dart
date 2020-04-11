import 'package:flutter/material.dart';

import 'firstclass.dart';

import 'Controller.dart';
import 'WeekPromo.dart';
import 'destination_screen.dart';
import 'near_promo.dart';

class DestinationCarousel extends StatelessWidget {
  Controller controller;

  DestinationCarousel(Controller controller) {
    this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Em destaque',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                onTap: () => print('ver todos'),
                child: Text(
                  'Ver todos',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FirstClassDestination(controller),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: weekPromo(controller),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: nearPromo(controller),
        ),
//        Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: FirstClassDestination(controller),
//        ),
      ],
    );
  }
}
