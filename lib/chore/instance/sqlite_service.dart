import 'package:bud_get/chore/handler/data_response.dart';
import 'package:bud_get/chore/handler/either.dart';
import 'package:bud_get/common/data/local/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  static final SqliteService instance = SqliteService._singleton();
  // This is a named consturctor with a private modifier
  // Search it yourself
  SqliteService._singleton();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await SQLiteService.init();
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

  Future<DataResponse<Map<String, dynamic>?>> getById(
    String table,
    int id,
  ) async {
    try {
      final db = await database;
      final result = await db.query(table, where: 'id = ?', whereArgs: [id]);
      return DataResponse(
        status: true,
        message: 'Get by ID successful',
        data: result.isNotEmpty ? result.first : null,
      );
    } catch (e) {
      return DataResponse(status: false, message: 'Get by ID failed: $e');
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

  Future<DataResponse<int>> clearTable(String table) async {
    try {
      final db = await database;
      final count = await db.delete(table);
      return DataResponse(
        status: true,
        message: 'Table cleared successfully',
        data: count,
      );
    } catch (e) {
      return DataResponse(status: false, message: 'Clear table failed: $e');
    }
  }
}
