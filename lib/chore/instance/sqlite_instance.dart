import 'package:bud_get/chore/handler/either.dart';
import 'package:bud_get/storage/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteInstance {
  static final SQLiteInstance _instance = SQLiteInstance._singleton();
  factory SQLiteInstance() => _instance;
  // This is a named consturctor with a private modifier
  // Search it yourself
  SQLiteInstance._singleton();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await SQLite.init();
    return _database!;
  }

  Future<Either<Exception, int>> insert(
    String table,
    Map<String, dynamic> data,
  ) async {
    try {
      final db = await database;
      final id = await db.insert(table, data);
      return Right(id);
    } catch (e) {
      return Left(Exception('Insert failed: $e'));
    }
  }

  Future<Either<Exception, List<Map<String, dynamic>>>> getAll(
    String table, {
    String? orderBy,
  }) async {
    try {
      final db = await database;
      final result = await db.query(table, orderBy: orderBy);
      return Right(result);
    } catch (e) {
      return Left(Exception('Query failed: $e'));
    }
  }

  Future<Either<Exception, Map<String, dynamic>?>> getById(
    String table,
    int id,
  ) async {
    try {
      final db = await database;
      final result = await db.query(table, where: 'id = ?', whereArgs: [id]);
      return Right(result.isNotEmpty ? result.first : null);
    } catch (e) {
      return Left(Exception('Get by ID failed: $e'));
    }
  }

  Future<Either<Exception, int>> update(
    String table,
    Map<String, dynamic> data,
    int id,
  ) async {
    try {
      final db = await database;
      final count = await db.update(
        table,
        data,
        where: 'id = ?',
        whereArgs: [id],
      );
      return Right(count);
    } catch (e) {
      return Left(Exception('Update failed: $e'));
    }
  }

  Future<Either<Exception, int>> delete(String table, int id) async {
    try {
      final db = await database;
      final count = await db.delete(table, where: 'id = ?', whereArgs: [id]);
      return Right(count);
    } catch (e) {
      return Left(Exception('Delete failed: $e'));
    }
  }

  Future<Either<Exception, int>> clearTable(String table) async {
    try {
      final db = await database;
      final count = await db.delete(table);
      return Right(count);
    } catch (e) {
      return Left(Exception('Clear table failed: $e'));
    }
  }
}
