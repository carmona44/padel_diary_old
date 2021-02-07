import 'dart:io';

import 'package:padel_diary/models/match_model.dart';
import 'package:padel_diary/models/player_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'PadelDiaryDB.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE players(
            player_id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            surname TEXT,
            position TEXT,
            age INTEGER,
            level INTEGER,
            dominant_hand TEXT,
            avatar TEXT,
            country TEXT,
            region TEXT,
            favourite_hit TEXT,
            racket TEXT
          )
        ''');

      await db.execute('''
          CREATE TABLE matches(
            match_id INTEGER PRIMARY KEY,
            date INTEGER,
            club INTEGER,
            teamA_left INTEGER,
            teamA_right INTEGER,
            teamA_first_set INTEGER,
            teamA_second_set INTEGER,
            teamA_third_set INTEGER,
            teamB_left INTEGER,
            teamB_right INTEGER,
            teamB_first_set INTEGER,
            teamB_second_set INTEGER,
            teamB_third_set INTEGER,
            tournament INTEGER,
            comments TEXT,
            effort INTEGER,
            temperature INTEGER,
            mvp INTEGER,
            duration INTEGER,
            ball INTEGER,
            FOREIGN KEY (teamA_left) REFERENCES players (player_id) ON DELETE CASCADE ON UPDATE NO ACTION,
            FOREIGN KEY (teamA_right) REFERENCES players (player_id) ON DELETE CASCADE ON UPDATE NO ACTION,
            FOREIGN KEY (teamB_left) REFERENCES players (player_id) ON DELETE CASCADE ON UPDATE NO ACTION,
            FOREIGN KEY (teamB_right) REFERENCES players (player_id) ON DELETE CASCADE ON UPDATE NO ACTION,
            FOREIGN KEY (mvp) REFERENCES players (player_id) ON DELETE CASCADE ON UPDATE NO ACTION,
            FOREIGN KEY (club) REFERENCES clubs (club_id) ON DELETE CASCADE ON UPDATE NO ACTION,
            FOREIGN KEY (tournament) REFERENCES tournaments (tournament_id) ON DELETE CASCADE ON UPDATE NO ACTION,
            FOREIGN KEY (ball) REFERENCES balls (ball_id) ON DELETE NO ACTION ON UPDATE NO ACTION
          )
        ''');

      await db.execute('''
          CREATE TABLE clubs(
            club_id INTEGER PRIMARY KEY,
            name TEXT NOT NULL UNIQUE,
            city TEXT,
            type TEXT,
            picture TEXT
          )
        ''');

      await db.execute('''
          CREATE TABLE balls(
            ball_id INTEGER PRIMARY KEY,
            brand TEXT,
            model TEXT
          )
        ''');

      await db.execute('''
          CREATE TABLE tournaments(
            tournament_id INTEGER PRIMARY KEY,
            name TEXT NOT NULL UNIQUE,
            city TEXT,
            level INTEGER
          )
        ''');
    });
  }

  //-----------------------------------------------
  //----------- JUGADORES -------------------------
  //-----------------------------------------------

  Future<int> createPlayer(Player newPlayer) async {
    final db = await database;
    final res = db.insert('players', newPlayer.toJson());
    return res;
  }

  Future<List<Player>> getAllPlayers() async {
    final db = await database;
    final res = await db.query('players');

    return res.isNotEmpty
        ? res.map((player) => Player.fromJson(player)).toList()
        : null;
  }

  //-----------------------------------------------
  //----------- PARTIDOS --------------------------
  //-----------------------------------------------

  Future<int> createMatch(Match newMatch) async {
    final db = await database;
    final res = db.insert('matches', newMatch.toJson());
    return res;
  }

  Future<List<Match>> getAllMatches() async {
    final db = await database;
    final res = await db.query('matches');

    return res.isNotEmpty
        ? res.map((match) => Match.fromJson(match)).toList()
        : null;
  }

  Future<List<dynamic>> getMatchesResult() async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT 
        match_id,
        date,
        p1.name as teamA_left,
        p2.name as teamA_right,
        p3.name as teamB_left,
        p4.name as teamB_right,
        teamA_first_set,
        teamA_second_set,
        teamA_third_set,
        teamB_first_set,
        teamB_second_set,
        teamB_third_set
      FROM
        matches
      INNER JOIN
        players p1 ON teamA_left = p1.player_id
      INNER JOIN
        players p2 ON teamA_right = p2.player_id
      INNER JOIN
        players p3 ON teamB_left = p3.player_id
      INNER JOIN
        players p4 ON teamB_right = p4.player_id
    ''');

    return res.isNotEmpty
        ? res.map((match) => Match.fromJson(match)).toList()
        : null;
  }
}
