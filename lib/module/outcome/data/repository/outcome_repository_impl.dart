import 'package:bud_get/chore/handler/data_response.dart';
import 'package:bud_get/chore/handler/either.dart';
import 'package:bud_get/module/outcome/data/datasource/outcome_datasource.dart';
import 'package:bud_get/module/outcome/domain/repository/outcome_repository.dart';
import 'package:bud_get/module/outcome/model/outcome_model.dart';

class OutcomeRepositoryImpl extends OutcomeRepository {
  final OutcomeDatasource outcomeDatasource;
  OutcomeRepositoryImpl(this.outcomeDatasource);

  @override
  Future<Either<Exception, DataResponse>> getOutcomeList({required int skip}) {
    return outcomeDatasource.fetchOutcomeList(skip: skip);
  }

  @override
  Future<Either<Exception, DataResponse>> createOutcome({
    required OutcomeModel outcomeModel,
  }) {
    return outcomeDatasource.storeOutcome(outcomeModel: outcomeModel);
  }

  @override
  Future<Either<Exception, DataResponse>> editOutcome({
    required OutcomeModel outcomeModel,
  }) {
    return outcomeDatasource.updateOutcome(outcomeModel: outcomeModel);
  }

  @override
  Future<Either<Exception, void>> deleteOutcome({required String outcomeId}) {
    return outcomeDatasource.destroyOutcome(outcomeId: outcomeId);
  }
}
