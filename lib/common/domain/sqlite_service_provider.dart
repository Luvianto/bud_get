import 'package:bud_get/common/data/local/service/sqlite_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sqliteServiceProvider = Provider<SqliteService>((ref) {
  final SqliteService sqliteService = SqliteService.instance;
  return sqliteService;
});
