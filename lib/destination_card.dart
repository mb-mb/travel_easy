import 'package:flutter/material.dart';

import 'destination_screen.dart';
import 'models/destination.dart';

class DestinationCard extends StatelessWidget {
  Destination destination;
  //  String destination_url;
  // List<Activities> activities;

  DestinationCard(Destination destination) {
    // , String destination_url, List<Activities> activities) {
    this.destination = destination;
//    this.destination_url = destination_url;
//    this.activities = activities;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.yellow,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
//            Destination destination = destination[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(destination.destination,
                        destination.url, destination.activities),
                  )),
              child: Container(
                child: Text(this.destination.destination),
              ),
            );
          }),
    );
  }
}
