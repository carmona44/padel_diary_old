import 'dart:convert';

Player playerFromJson(String str) => Player.fromJson(json.decode(str));

String playerToJson(Player data) => json.encode(data.toJson());

class Player {
  Player({
    this.playerId,
    this.name,
    this.surname,
    this.position,
    this.age,
    this.level,
    this.dominantHand,
    this.avatar,
    this.country,
    this.region,
    this.favouriteHit,
    this.racket,
  });

  int playerId;
  String name;
  String surname;
  String position;
  int age;
  int level;
  String dominantHand;
  String avatar;
  String country;
  String region;
  String favouriteHit;
  String racket;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        playerId: json["player_id"],
        name: json["name"],
        surname: json["surname"],
        position: json["position"],
        age: json["age"],
        level: json["level"],
        dominantHand: json["dominant_hand"],
        avatar: json["avatar"],
        country: json["country"],
        region: json["region"],
        favouriteHit: json["favourite_hit"],
        racket: json["racket"],
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "name": name,
        "surname": surname,
        "position": position,
        "age": age,
        "level": level,
        "dominant_hand": dominantHand,
        "avatar": avatar,
        "country": country,
        "region": region,
        "favourite_hit": favouriteHit,
        "racket": racket,
      };
}
