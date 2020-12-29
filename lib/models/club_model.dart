import 'dart:convert';

Club clubFromJson(String str) => Club.fromJson(json.decode(str));

String clubToJson(Club data) => json.encode(data.toJson());

class Club {
  Club({
    this.clubId,
    this.name,
    this.city,
    this.type,
    this.picture,
  });

  int clubId;
  String name;
  String city;
  String type;
  String picture;

  factory Club.fromJson(Map<String, dynamic> json) => Club(
        clubId: json["club_id"],
        name: json["name"],
        city: json["city"],
        type: json["type"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "club_id": clubId,
        "name": name,
        "city": city,
        "type": type,
        "picture": picture,
      };
}
