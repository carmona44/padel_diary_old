import 'package:flutter/material.dart';
import 'package:padel_diary/models/player_model.dart';
import 'package:padel_diary/providers/db_provider.dart';

class PlayerProvider extends ChangeNotifier {
  List<Player> players = [];

  createPlayer(Player newPlayer) async {
    final id = await DBProvider.db.createPlayer(newPlayer);
    newPlayer.playerId = id;

    this.players.add(newPlayer);
    notifyListeners();
  }

  getAllPlayers() async {
    final players = await DBProvider.db.getAllPlayers();
    this.players = [...players];
    notifyListeners();
  }
}
