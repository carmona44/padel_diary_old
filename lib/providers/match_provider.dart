import 'package:flutter/material.dart';
import 'package:padel_diary/models/match_model.dart';
import 'package:padel_diary/providers/db_provider.dart';

class MatchProvider extends ChangeNotifier {
  List<Match> matches = [];

  createMatch(Match newMatch) async {
    final id = await DBProvider.db.createMatch(newMatch);
    newMatch.matchId = id;

    this.matches.add(newMatch);
    notifyListeners();
  }

  getAllMatches() async {
    final matches = await DBProvider.db.getAllMatches();
    this.matches = [...matches];
    notifyListeners();
  }
}
