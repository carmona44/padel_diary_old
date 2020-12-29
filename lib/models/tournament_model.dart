import 'dart:convert';

Tournament tournamentFromJson(String str) =>
    Tournament.fromJson(json.decode(str));

String tournamentToJson(Tournament data) => json.encode(data.toJson());

class Tournament {
  Tournament({
    this.tournamentId,
    this.name,
    this.city,
    this.level,
  });

  int tournamentId;
  String name;
  String city;
  int level;

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        tournamentId: json["tournament_id"],
        name: json["name"],
        city: json["city"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "tournament_id": tournamentId,
        "name": name,
        "city": city,
        "level": level,
      };
}
