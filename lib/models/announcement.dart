import 'dart:convert';

class Announcement {
  String idUser;
  DateTime dateofDeparture;
  DateTime dateofArrival;
  String information;
  String codep;
  dynamic tag;
  dynamic assessment;
  List<dynamic> claims;
  String size;
  String country;
  String placeOfDeparture;
  String placeOfArrival;
  String timeOfDeparture;
  String acceptedSize;
  String adress;
  String city;
  String timeOfArrival;
  String flightNumber;

  Announcement({
    required this.idUser,
    required this.dateofDeparture,
    required this.dateofArrival,
    required this.information,
    required this.codep,
    this.tag,
    this.assessment,
    this.claims = const [],
    required this.size,
    required this.country,
    required this.placeOfDeparture,
    required this.placeOfArrival,
    required this.timeOfDeparture,
    required this.acceptedSize,
    required this.adress,
    required this.city,
    required this.timeOfArrival,
    required this.flightNumber,
  });

  factory Announcement.fromRawJson(String str) =>
      Announcement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        idUser: json["idUser"],
        dateofDeparture: _parseDateTime(json["dateofDeparture"]),
        dateofArrival: _parseDateTime(json["dateofArrival"]),
        information: json["information"],
        codep: json["codep"],
        tag: json["tag"],
        assessment: json["assessment"],
        claims: json["claims"] ?? [],
        size: json["size"],
        country: json["country"],
        placeOfDeparture: json["place_of_departure"],
        placeOfArrival: json["place_of_arrival"],
        timeOfDeparture: json["time_of_departure"],
        acceptedSize: json["accepted_size"],
        adress: json["adress"],
        city: json["city"],
        timeOfArrival: json["time_of_arrival"],
        flightNumber: json["flightNumber"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "dateofDeparture": dateofDeparture.toIso8601String(),
        "dateofArrival": dateofArrival.toIso8601String(),
        "information": information,
        "codep": codep,
        "size": size,
        "country": country,
        "place_of_departure": placeOfDeparture,
        "place_of_arrival": placeOfArrival,
        "time_of_departure": timeOfDeparture,
        "accepted_size": acceptedSize,
        "adress": adress,
        "city": city,
        "time_of_arrival": timeOfArrival,
        "flightNumber": flightNumber,

        /* "idUser": "4fed605b-bc62-427e-a972-339f5ab163fc",
        "dateofDeparture": "2024-08-15",
        "dateofArrival": "2024-08-16",
        "adress": "123 Main Street",
        "codep": "75001",
        "city": "Paris",
        "country": "France",
        "information": "Some additional information",
        "place_of_departure": placeOfDeparture,
        "place_of_arrival": placeOfArrival,
        "time_of_arrival": "14:30",
        "accepted_size": "Grand",
        "time_of_departure": "12:00",
        "size": "50",
        "flightNumber": "AF1234" */
      };

  static DateTime _parseDateTime(dynamic date) {
    if (date is String) {
      return DateTime.parse(date);
    } else if (date is int) {
      return DateTime.fromMillisecondsSinceEpoch(date);
    } else {
      throw Exception('Invalid date format');
    }
  }
}
