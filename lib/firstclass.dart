import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Controller.dart';
import 'destination_card.dart';
import 'destination_screen.dart';
import 'models/destination.dart';

class FirstClassDestination extends StatelessWidget {
  Controller controller;
  List<Destination> destinations;

  FirstClassDestination(Controller controller) {
    this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        color: Colors.yellow,
        child: FutureBuilder<List<Destination>>(
            future: controller.fetchDestinations(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                this.destinations = snapshot.data;
                return Container(
                    height: 300.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.getDestinationsCount(),
                        itemBuilder: (BuildContext context, int index) {
                          // cartao em destaque
                          DestinationCard card =
                              DestinationCard(controller.destinations()[index]);

                          return Container(
                            margin: EdgeInsets.all(5.0),
                            width: 210.0,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Positioned(
                                  bottom: 15.0,
                                  child: Container(
                                    height: 120.0,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                card.destination.destination,
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2),
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 1, 2, 2),
                                            decoration: BoxDecoration(
                                              color: Colors.blue.shade500,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: ratingCell(
                                                card.destination.rating),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                child: Text(
                                                  "preco",
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  " \$" +
                                                      card.destination.price
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0.0, 2.0),
                                          blurRadius: 6.0),
                                    ],
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    DestinationScreen(
                                                        card.destination
                                                            .destination,
                                                        card.destination.url,
                                                        card.destination
                                                            .activities),
                                              ));
                                        },
                                        child: Hero(
                                          tag: card.destination.url,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Image(
                                              height: 180.0,
                                              width: 180.0,
                                              image: imageDestinations(index),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10.0,
                                        bottom: 10.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              card.destination.city,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  FontAwesomeIcons
                                                      .locationArrow,
                                                  size: 10.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(
                                                  card.destination.country,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }));
              }
            }));
  }

  imageDestinations(int index) {
    return AdvancedNetworkImage(destinations[index].url,
        useDiskCache: true, timeoutDuration: Duration(minutes: 1));
  }

  ratingCell(String rating) {
    String stars = '';
    int _rat = int.parse(rating);

    for (int i = 0; i < _rat; i++) {
      stars += '⭐';
    }
    return Text(stars);
  }
}
