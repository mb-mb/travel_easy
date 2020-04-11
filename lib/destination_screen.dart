import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'models/destination.dart';

class DestinationScreen extends StatefulWidget {
  String destination;
  String destination_url;
  List<Activities> activities;

  DestinationScreen(
      String destination, String destination_url, List<Activities> activities) {
    this.destination = destination;
    this.destination_url = destination_url;
    this.activities = activities;
  }

  @override
  State<StatefulWidget> createState() =>
      _DestinationState(destination, destination_url, activities);
}

class _DestinationState extends State<DestinationScreen> {
  String destination;
  String destination_url;
  List<Activities> activities;

  _DestinationState(
      String destination, String destination_url, List<Activities> activities) {
    this.destination = destination;
    this.destination_url = destination_url;
    this.activities = activities;
  }

  Text _buildRatingStars(int rating) {
    String stars = '';

    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ]),
                child: Hero(
                  tag: destination_url,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: imageDestinations(destination_url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      destination,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 10.0,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          destination,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 25.0,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: activities.length,
                itemBuilder: (BuildContext context, int index) {
                  Activities activitie = activities[index];
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 170.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 120.0,
                                    child: Text(
                                      activities[index].activitie,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "\$30",
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "per tax",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                "activit type",
                                style: TextStyle(color: Colors.grey),
                              ),
                              _buildRatingStars(3),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(activities[index].activitie),
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  Container(
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(activities[index].activitie),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 15.0,
                        bottom: 15.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 110.0,
                            image: imageDestinations(destination_url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  imageDestinations(String param) {
    return AdvancedNetworkImage(param,
        useDiskCache: true, timeoutDuration: Duration(minutes: 1));

//    return CachedNetworkImage(
//      imageUrl: param,
//      placeholder: (context, url) => CircularProgressIndicator(),
//      errorWidget: (context, url, error) => Icon(Icons.error),
//    );
  }
}
