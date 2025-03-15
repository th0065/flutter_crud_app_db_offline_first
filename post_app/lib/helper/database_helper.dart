import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'bien_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE biens(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titre TEXT,
        description TEXT,
        prix REAL,
        version INTEGER
      )
    ''');
  }

  Future<void> insertBien(Map<String, dynamic> bien) async {
    final db = await database;
    await db.insert('biens', bien, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getBiens() async {
    final db = await database;
    return await db.query('biens');
  }

  Future<void> updateBien(Map<String, dynamic> bien) async {
    final db = await database;
    await db.update('biens', bien, where: 'id = ?', whereArgs: [bien['id']]);
  }

  Future<void> deleteBien(int id) async {
    final db = await database;
    await db.delete('biens', where: 'id = ?', whereArgs: [id]);
  }
}