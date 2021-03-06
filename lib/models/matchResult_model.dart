import 'dart:convert';

MatchResult matchResultFromJson(String str) =>
    MatchResult.fromJson(json.decode(str));

String matchResultToJson(MatchResult data) => json.encode(data.toJson());

class MatchResult {
  MatchResult(
      {this.matchId,
      this.date,
      this.teamALeft,
      this.teamARight,
      this.teamAFirstSet,
      this.teamASecondSet,
      this.teamAThirdSet,
      this.teamBLeft,
      this.teamBRight,
      this.teamBFirstSet,
      this.teamBSecondSet,
      this.teamBThirdSet});

  int matchId;
  int date;
  String teamALeft;
  String teamARight;
  int teamAFirstSet;
  int teamASecondSet;
  int teamAThirdSet;
  String teamBLeft;
  String teamBRight;
  int teamBFirstSet;
  int teamBSecondSet;
  int teamBThirdSet;

  factory MatchResult.fromJson(Map<String, dynamic> json) => MatchResult(
      matchId: json["match_id"],
      date: json["date"],
      teamALeft: json["teamA_left"],
      teamARight: json["teamA_right"],
      teamAFirstSet: json["teamA_first_set"],
      teamASecondSet: json["teamA_second_set"],
      teamAThirdSet: json["teamA_third_set"],
      teamBLeft: json["teamB_left"],
      teamBRight: json["teamB_right"],
      teamBFirstSet: json["teamB_first_set"],
      teamBSecondSet: json["teamB_second_set"],
      teamBThirdSet: json["teamB_third_set"]);

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "date": date,
        "teamA_left": teamALeft,
        "teamA_right": teamARight,
        "teamA_first_set": teamAFirstSet,
        "teamA_second_set": teamASecondSet,
        "teamA_third_set": teamAThirdSet,
        "teamB_left": teamBLeft,
        "teamB_right": teamBRight,
        "teamB_first_set": teamBFirstSet,
        "teamB_second_set": teamBSecondSet,
        "teamB_third_set": teamBThirdSet
      };
}
