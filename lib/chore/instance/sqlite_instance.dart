import 'package:bud_get/chore/handler/data_response.dart';
import 'package:bud_get/common/data/local/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteInstance {
  static final SQLiteInstance instance = SQLiteInstance._singleton();
  // This is a named consturctor with a private modifier
  // Search it yourself
  SQLiteInstance._singleton();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await SQLiteService.init();
    return _database!;
  }

  Future<DataResponse<int>> insert(
    String table,
    Map<String, dynamic> data,
  ) async {
    try {
      final db = await database;
      final id = await db.insert(table, data);
      return DataResponse(status: true, message: 'Insert successful', data: id);
    } catch (e) {
      return DataResponse(status: false, message: 'Insert failed: $e');
    }
  }

  Future<DataResponse<List<Map<String, dynamic>>>> getAll(
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
      return DataResponse(
        status: true,
        message: 'Query successful',
        data: result,
      );
    } catch (e) {
      return DataResponse(status: false, message: 'Query failed: $e');
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

  Future<DataResponse<int>> update(
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
      return DataResponse(
        status: true,
        message: count > 0 ? 'Update successful' : 'No record found to update',
        data: count,
      );
    } catch (e) {
      return DataResponse(status: false, message: 'Update failed: $e');
    }
  }

  Future<DataResponse<int>> delete(String table, int id) async {
    try {
      final db = await database;
      final count = await db.delete(table, where: 'id = ?', whereArgs: [id]);
      return DataResponse(
        status: true,
        message: count > 0 ? 'Delete successful' : 'No record found to delete',
        data: count,
      );
    } catch (e) {
      return DataResponse(status: false, message: 'Delete failed: $e');
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
