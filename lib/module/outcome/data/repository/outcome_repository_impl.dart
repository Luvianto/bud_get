import 'package:bud_get/chore/handler/data_response.dart';
import 'package:bud_get/chore/handler/either.dart';
import 'package:bud_get/module/outcome/data/datasource/outcome_datasource.dart';
import 'package:bud_get/module/outcome/domain/repository/outcome_repository.dart';
import 'package:bud_get/module/outcome/model/outcome_model.dart';

class OutcomeRepositoryImpl extends OutcomeRepository {
  final OutcomeDatasource outcomeDatasource;
  OutcomeRepositoryImpl(this.outcomeDatasource);

  @override
  Future<Either<Exception, DataResponse>> fetchOutcomeList({
    required int skip,
  }) {
    return outcomeDatasource.getOutcomeList(skip: skip);
  }

  @override
  Future<Either<Exception, DataResponse>> storeOutcome({
    required OutcomeModel outcomeModel,
  }) {
    return outcomeDatasource.createOutcome(outcomeModel: outcomeModel);
  }

  @override
  Future<Either<Exception, DataResponse>> updateOutcome({
    required OutcomeModel outcomeModel,
  }) {
    return outcomeDatasource.editOutcome(outcomeModel: outcomeModel);
  }

  @override
  Future<Either<Exception, void>> destroyOutcome({required String outcomeId}) {
    return outcomeDatasource.deleteOutcome(outcomeId: outcomeId);
  }
}
