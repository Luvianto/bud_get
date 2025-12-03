import 'package:bud_get/chore/instance/sqlite_service.dart';
import 'package:bud_get/common/domain/sqlite_provider.dart';
import 'package:bud_get/module/outcome/data/datasource/outcome_datasource.dart';
import 'package:bud_get/module/outcome/data/repository/outcome_repository_impl.dart';
import 'package:bud_get/module/outcome/domain/repository/outcome_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final outcomeDatasourceProvider =
    Provider.family<OutcomeDatasource, SqliteService>(
      (_, sqliteService) => OutcomeLocalDatasource(sqliteService),
    );

final outcomeRepositoryProvider = Provider<OutcomeRepository>((ref) {
  final sqliteService = ref.watch(sqliteServiceProvider);
  final datasource = ref.watch(outcomeDatasourceProvider(sqliteService));
  final repository = OutcomeRepositoryImpl(datasource);

  return repository;
});
