import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:travel_easy_v2/models/user_auth.dart';
import 'repository/repository.dart';

import 'models/destination.dart';

class Controller {
  Destination _destination;
  List<Destination> _list_destination = List<Destination>();
  //List<String> _weekPromo;

  Repository repository;
  UserAuth currentUser;

  Controller(Destination destination) {
    this._destination = destination;
    this.repository = new Repository();
    repository.authentication().then((user) {
      currentUser = user;
    });
  }

  Controller.noParams() {
    this._destination = Destination(
        destination: "no where",
        rating: "0",
        activities: null,
        city: "exodus",
        country: "NO",
        price: 1.99);
    this.repository = Repository();
    repository.authentication().then((user) {
      currentUser = user;
    });
  }

  /// ---
  /// stream bloc Destination
  /// ---
  BehaviorSubject<List<Destination>> _behaviourDestination;
  Stream<List<Destination>> get destinationObservable =>
      _behaviourDestination.stream;

  int getDestinationsCount() {
    if (_list_destination.isEmpty) {
      repository.fetchDestinations().then((list) {
        _list_destination = list;
        return _list_destination.length;
      });
    } else {
      return _list_destination.length;
    }
  }

  Destination destination() {
    return _destination;
  }

  bool setDestination(Destination destination) {
    this._destination = destination;
    return true;
  }

  int destinationsCount() {
    return this.destination().activities.length;
  }

  List<String> weekPromotion() {
    return _weekPromo;
  }

  Color primaryColor() {
    return Colors.blueAccent;
  }

  List<String> _weekPromo = ['Promo1', 'Promo2'];

  List<Destination> destinations() {
    repository.fetchDestinations();
  }

  /// ---
  /// Destination future methods
  /// ---
  Future<List<Destination>> fetchDestinations() async {
    // ignore: missing_return
    return await repository.fetchDestinations().then((val) {
      _behaviourDestination.sink.add(val);
    });
  }
}
