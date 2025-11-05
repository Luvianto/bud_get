import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteService {
  static const _dbName = 'bud_get.db';
  static const _dbVersion = 1;

  static Future<Database> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE outcomes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        amount INTEGER NOT NULL,
        title TEXT NOT NULL,
        description TEXT NOT NULL
      )
    ''');
  }

  // onUpgrade is used migrate new changes to existing database on user phone safely
  // Instead of deleting the old database and losing data
  static Future<void> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {}
}
