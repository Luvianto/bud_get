import 'package:bud_get/chore/handler/data_response.dart';
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

  /// Insert a single row into [table]
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

  /// Retrieve all rows from [table]
  Future<DataResponse<List<Map<String, dynamic>>>> getAll(
    String table, {
    String? orderBy,
  }) async {
    try {
      final db = await database;
      final result = await db.query(table, orderBy: orderBy);
      return DataResponse(
        status: true,
        message: 'Query successful',
        data: result,
      );
    } catch (e) {
      return DataResponse(status: false, message: 'Query failed: $e');
    }
  }

  /// Retrieve a single row by [id]
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

  /// Update a row by [id]
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

  /// Delete a row by [id]
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

  /// Clear all rows from [table]
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
