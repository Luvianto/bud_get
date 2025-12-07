import 'package:bud_get/common/handler/either.dart';
import 'package:bud_get/common/data/local/service/sqlite_service.dart';

abstract class OutcomeDatasource {
  Future<Either<Exception, List<Map<String, dynamic>>>> fetchOutcomeList();
  Future<Either<Exception, Map<String, dynamic>>> storeOutcome({
    required Map<String, dynamic> body,
  });
  Future<Either<Exception, Map<String, dynamic>>> updateOutcome({
    required Map<String, dynamic> body,
    required int id,
  });
  Future<Either<Exception, int>> destroyOutcome({required int id});
}

class OutcomeLocalDatasource extends OutcomeDatasource {
  final SqliteService sqliteService;
  OutcomeLocalDatasource(this.sqliteService);

  @override
  Future<Either<Exception, List<Map<String, dynamic>>>>
  fetchOutcomeList() async {
    final result = await sqliteService.getAll(
      'outcomes',
      orderBy: 'date DESC',
      where: null,
      whereArgs: null,
    );

    return result.fold((l) => Left(l), (r) {
      if (r == null) {
        return Left(Exception('Empty data'));
      }
      return Right(r);
    });
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> storeOutcome({
    required Map<String, dynamic> body,
  }) async {
    final result = await sqliteService.insert('outcomes', body);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> updateOutcome({
    required Map<String, dynamic> body,
    required int id,
  }) async {
    final result = await sqliteService.update('outcomes', body, id);
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<Exception, int>> destroyOutcome({required int id}) async {
    final result = await sqliteService.delete('outcomes', id);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
