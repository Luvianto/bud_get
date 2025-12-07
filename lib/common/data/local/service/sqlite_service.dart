import 'package:bud_get/common/handler/either.dart';
import 'package:bud_get/storage/sqlite_database.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  static final SqliteService instance = SqliteService._singleton();
  // This is a named consturctor with a private modifier
  // Search it yourself
  SqliteService._singleton();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await SqliteDatabase.init();
    return _database!;
  }

  Future<Either<Exception, Map<String, dynamic>>> insert(
    String table,
    Map<String, dynamic> data,
  ) async {
    try {
      final db = await database;
      final id = await db.insert(table, data);
      return Right({'id': id, ...data});
    } catch (e) {
      return Left(Exception('Insert failed: $e'));
    }
  }

  Future<Either<Exception, List<Map<String, dynamic>>?>> getAll(
    String table, {
    String? orderBy,
    String? where,
    List<Object?>? whereArgs,
  }) async {
    try {
      final db = await database;
      final result = await db.query(
        table,
        orderBy: orderBy,
        where: where,
        whereArgs: whereArgs,
      );
      return Right(result);
    } catch (e) {
      return Left(Exception('Get all data failed: $e'));
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

  Future<Either<Exception, Map<String, dynamic>>> update(
    String table,
    Map<String, dynamic> data,
    int id,
  ) async {
    try {
      final db = await database;
      await db.update(table, data, where: 'id = ?', whereArgs: [id]);
      return Right(data);
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
