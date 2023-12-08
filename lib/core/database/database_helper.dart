import 'package:final_homework/source/models/grain_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    return await openDatabase(
      join(path, 'grain_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE grains(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            time TEXT,
            lightPower INTEGER,
            heat INTEGER,
            percentOfHumidity INTEGER,
            irrigationTime INTEGER,
            irrigationInterval INTEGER,
            slopeDegree REAL
          )''',
        );
      },
      version: 1,
    );
  }

  Future<int> insertGrain(GrainModel grain) async {
    final db = await database;
    return await db.insert('grains', grain.toMap());
  }

  Future<List<GrainModel>> getAllGrains() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('grains');
    return List.generate(maps.length, (i) {
      return GrainModel(
        id: maps[i]['id'],
        time: maps[i]['time'],
        lightPower: maps[i]['lightPower'],
        heat: maps[i]['heat'],
        percentOfHumidity: maps[i]['percentOfHumidity'],
        irrigationTime: maps[i]['irrigationTime'],
        irrigationInterval: maps[i]['irrigationInterval'],
        slopeDegree: maps[i]['slopeDegree'],
      );
    });
  }

  Future<int> updateGrain(GrainModel grain) async {
    final db = await database;
    return await db.update(
      'grains',
      grain.toMap(),
      where: 'id = ?',
      whereArgs: [grain.id],
    );
  }

  Future<int> deleteGrain(int id) async {
    final db = await database;
    return await db.delete(
      'grains',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
