import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_easy_v2/contants.dart';
import 'package:travel_easy_v2/models/destination.dart';

import '../models/user_auth.dart';

class Repository {
  UserAuth _currentUser;

  Future<UserAuth> authentication() async {
    http.Client client = http.Client();
    String body =
        '{"userCode": "dev", "accessKey": "emVtb3BAeSBtZWlvcyBkZSBwYWdhbWVudG8gc2E="}';
    Map<String, String> header = {"Content-Type": "application/json"};
    final response =
        await client.post(Strings.auth, headers: header, body: body);
    if (response.statusCode == 500 || response.statusCode == 404) {
      return UserAuth(null, null, null, null, null);
    } else {
      return UserAuth(null, "response.body.accesstoken", null, null, null);
    }
  }

  Future<List<Destination>> fetchDestinations() async {
    http.Client client = http.Client();
    final response = await client.get(Strings.url_destinations);
    return parseDestination(response.body);
  }

  List<Destination> parseDestination(String responseBody) {
    final parsed = json.decode(responseBody).cast<String>();
    return parsed
        .map<Destination>((json) => Destination.fromJson(json))
        .toList();
  }

  signInWithEmailAndPassword({String email, String password}) {
    this._currentUser =
        UserAuth(null, "response.body.accesstoken", null, null, null);
    return _currentUser;
  }

  createUserWithEmailAndPassword({String email, String password}) {
    return UserAuth(null, "response.body.accesstoken", null, null, null);
  }

  currentUser() {
    return _currentUser;
  }

  signOut() {
    _currentUser = null;
  }
}

/*

    List<Activities> act = [
      Activities("Esqui"),
      Activities("mountain bike"),
    ];
    List<Activities> act2 = [
      Activities("kaysurf"),
      Activities("Windsurf"),
    ];

    List<Activities> act3 = act + act2;

    List<Destination> dest = [
      Destination(
          "Hotel Saint Paul",
          'https://images.pexels.com/photos/132037/pexels-photo-132037.jpeg',
          34.0,
          "3",
          "CA",
          "Malibu",
          act),
      Destination(
          "Mari August Hotel",
          'https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg',
          45.0,
          "4",
          "MO",
          "Aspen",
          act2),
      Destination(
          "Ziegraden Hotel",
          'https://images.pexels.com/photos/36717/amazing-animal-beautiful-beautifull.jpg',
          39.0,
          "4",
          "ZU",
          "Zuriq",
          act3),
      Destination(
          "Busao do Zé",
          'https://images.pexels.com/photos/132037/pexels-photo-132037.jpeg',
          78.90,
          "4",
          "PI",
          "Pedrinhas",
          act),
    ];

    return dest;
  }

 */
