import 'dart:io';

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

    //TODO: Crear todas las tablas, sus modelos y metodos
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Players(
            id INTEGER PRIMARY KEY,
            name TEXT,
            surname TEXT,
            age INTEGER,
            level INTEGER,
            position TEXT
          )
        ''');
    });
  }

  /*addPlayer(PlayerModel newPlayer) async {

  }*/
}
