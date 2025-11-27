import 'package:bud_get/chore/handler/either.dart';
import 'package:bud_get/module/outcome/data/datasource/outcome_datasource.dart';
import 'package:bud_get/module/outcome/domain/repository/outcome_repository.dart';
import 'package:bud_get/module/outcome/model/outcome_model.dart';

class OutcomeRepositoryImpl extends OutcomeRepository {
  final OutcomeDatasource outcomeDatasource;
  OutcomeRepositoryImpl(this.outcomeDatasource);

  @override
  Future<Either<Exception, List<Map<String, dynamic>>>> getOutcomeList() {
    return outcomeDatasource.fetchOutcomeList();
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> createOutcome({
    required OutcomeModel outcomeModel,
  }) {
    return outcomeDatasource.storeOutcome(body: outcomeModel.toMap());
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> editOutcome({
    required OutcomeModel outcomeModel,
  }) {
    return outcomeDatasource.updateOutcome(
      body: outcomeModel.toMap(),
      id: outcomeModel.id!,
    );
  }

  @override
  Future<Either<Exception, int>> deleteOutcome({required int id}) {
    return outcomeDatasource.destroyOutcome(id: id);
  }
}
