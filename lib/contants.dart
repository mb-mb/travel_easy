import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

enum FormType { login, register }

class Strings {
  static const http_base = "http://vps18285.publiccloud.com.br:9999";
  static const auth = "http://68.183.102.189/api/Authentication";
  static const urlActivities =
      "$http_base/api/Archives/ArchivePath?userToken=4c17e941-6af1-421b-98b7-2d244cc97fd6";
  static const url_destinations =
      "$http_base/api/Archives/ArchivePath?userToken=4c17e941-6af1-421b-98b7-2d244cc97fd6";
}
