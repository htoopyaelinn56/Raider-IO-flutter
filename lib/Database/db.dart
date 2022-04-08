import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'Player.dart';
import 'PlayerDao.dart';

part 'db.g.dart';

@Database(version: 1, entities: [Player])
abstract class AppDatabase extends FloorDatabase {
  PlayerDao get playerDao;
}
