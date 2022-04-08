import 'package:floor/floor.dart';

@entity
class Player {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  @ColumnInfo(name: 'name')
  final String name;
  @ColumnInfo(name: 'cls')
  final String cls;
  @ColumnInfo(name: 'spec')
  final String spec;
  @ColumnInfo(name: 'io')
  final double io;

  Player({
    this.id,
    required this.name,
    required this.cls,
    required this.spec,
    required this.io,
  });
}
