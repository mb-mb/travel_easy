import 'package:flutter/material.dart';

import 'destination_card.dart';
import 'models/destination.dart';

Widget nearPromo(controller) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Próximos de mim',
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
                    color: controller.primaryColor(),
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
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(color: Colors.transparent),
          child: FutureBuilder<List<Destination>>(
            future: controller.fetchDestinations(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (snapshot.hasData) {
                return Container(
                  child: ListView.builder(
                    itemCount: controller.destinations().length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            //margin: EdgeInsets.fromLTRB(40.0, 15.0, 30.0, 5.0),
                            height: 170.0,
                            width: 220.0,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: weeCard(controller, index),
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      )
    ],
  );
}

weeCard(controller, index) {
  // cartao em destaque
  DestinationCard card = DestinationCard(controller.destinations()[index]);

  return Container(
    height: 80.0,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.yellowAccent.shade700,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
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
            padding: EdgeInsets.fromLTRB(2, 1, 2, 2),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ratingCell(card.destination.rating),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              Container(
                child: Text(
                  "preco",
                  style: TextStyle(color: Colors.black38, fontSize: 16.0),
                ),
              ),
              Container(
                child: Text(
                  " \$" + card.destination.price.toString(),
                  style: TextStyle(color: Colors.black87, fontSize: 16.0),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

ratingCell(String rating) {
  String stars = '';
  int _rat = int.parse(rating);

  for (int i = 0; i < _rat; i++) {
    stars += '⭐';
  }
  return Text(stars);
}
