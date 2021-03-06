import 'dart:convert';

Match matchFromJson(String str) => Match.fromJson(json.decode(str));

String matchToJson(Match data) => json.encode(data.toJson());

class Match {
  Match({
    this.matchId,
    this.date,
    this.club,
    this.teamALeft,
    this.teamARight,
    this.teamAFirstSet,
    this.teamASecondSet,
    this.teamAThirdSet,
    this.teamBLeft,
    this.teamBRight,
    this.teamBFirstSet,
    this.teamBSecondSet,
    this.teamBThirdSet,
    this.winningTeam,
    this.tournament,
    this.effort,
    this.comments,
    this.temperature,
    this.mvp,
    this.duration,
    this.ball,
  });

  int matchId;
  int date;
  int club;
  int teamALeft;
  int teamARight;
  int teamAFirstSet;
  int teamASecondSet;
  int teamAThirdSet;
  int teamBLeft;
  int teamBRight;
  int teamBFirstSet;
  int teamBSecondSet;
  int teamBThirdSet;
  String winningTeam;
  int tournament;
  int effort;
  String comments;
  int temperature;
  int mvp;
  int duration;
  int ball;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
      matchId: json["match_id"],
      date: json["date"],
      club: json["club"],
      teamALeft: json["teamA_left"],
      teamARight: json["teamA_right"],
      teamAFirstSet: json["teamA_first_set"],
      teamASecondSet: json["teamA_second_set"],
      teamAThirdSet: json["teamA_third_set"],
      teamBLeft: json["teamB_left"],
      teamBRight: json["teamB_right"],
      teamBFirstSet: json["teamB_first_set"],
      teamBSecondSet: json["teamB_second_set"],
      teamBThirdSet: json["teamB_third_set"],
      winningTeam: json["winning_team"],
      tournament: json["tournament"],
      effort: json["effort"],
      comments: json["comments"],
      temperature: json["temperature"],
      mvp: json["mvp"],
      duration: json["duration"],
      ball: json["ball"]);

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "date": date,
        "club": club,
        "teamA_left": teamALeft,
        "teamA_right": teamARight,
        "teamA_first_set": teamAFirstSet,
        "teamA_second_set": teamASecondSet,
        "teamA_third_set": teamAThirdSet,
        "teamB_left": teamBLeft,
        "teamB_right": teamBRight,
        "teamB_first_set": teamBFirstSet,
        "teamB_second_set": teamBSecondSet,
        "teamB_third_set": teamBThirdSet,
        "winning_team": winningTeam,
        "tournament": tournament,
        "effort": effort,
        "comments": comments,
        "temperature": temperature,
        "mvp": mvp,
        "duration": duration,
        "ball": ball
      };
}
