import 'dart:ui';

class Destination {
  String destination;
  String rating;
  double price;
  String url;
  String country;
  String city;
  String tokenImage;
  List<ImageData> images;
  List<String> uf = ['SP', 'RJ', 'BA'];
  List<Activities> activities;

  Destination({
    this.destination,
    this.rating,
    this.price,
    this.country,
    this.city,
    this.url,
    this.images,
    this.tokenImage,
    this.activities,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      destination: json['destination'],
      url: json['url'],
      price: json['price'],
      rating: json['rating'],
      country: json['country'],
      city: json['city'],
      activities: json['activities'],
      tokenImage: json['tokenImage'],
      images: json['images'],
    );

//    return Destination(
//      json['destination'],
//      json['url'],
//      price: json['price'],
//      rating: json['rating'],
//      country: json['country'],
//      city: json['city'],
//      activities: json['activities'],
//      tokenImage: json['tokenImage'],
//      images: json['images'],
//    );
  }
}

class Activities {
  String activitie;
  Activities(String activitie) {
    this.activitie = activitie;
  }
}

class ImageData {
  String name;
  String url;
}
