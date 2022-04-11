import 'package:floor/floor.dart';
import 'package:raider_io_flutter/Database/Player.dart';

@dao
abstract class PlayerDao {
  @Query('SELECT * FROM Player')
  Future<List<Player>> findAllPlayer();

  @Query('SELECT * FROM Player')
  Stream<List<Player>> findAllPlayerByStream();

  @Query('SELECT * FROM Player WHERE id = :id')
  Stream<Player?> findPlayerById(int id);

  @insert
  Future<void> insertPlayer(Player p);

  @delete
  Future<void> deletePlayer(Player p);

  @Query('UPDATE Player SET io = :io, spec = :spec WHERE name = :name')
  Future<void> updatePlayer(double io, String spec, String name);
}
