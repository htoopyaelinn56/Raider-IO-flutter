import 'package:floor/floor.dart';
import 'package:raider_io_flutter/Database/Player.dart';

@dao
abstract class PlayerDao {
  @Query('SELECT * FROM Person')
  Future<List<Player>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Player?> findPersonById(int id);

  @insert
  Future<void> insertPerson(Player person);
}
