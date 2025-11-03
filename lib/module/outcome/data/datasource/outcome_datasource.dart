import 'package:bud_get/chore/handler/data_response.dart';
import 'package:bud_get/chore/handler/either.dart';
import 'package:bud_get/module/outcome/model/outcome_model.dart';

abstract class OutcomeDatasource {
  Future<Either<Exception, DataResponse>> getOutcomeList({required int skip});
  Future<Either<Exception, DataResponse>> createOutcome({
    required OutcomeModel outcomeModel,
  });
  Future<Either<Exception, DataResponse>> editOutcome({
    required OutcomeModel outcomeModel,
  });
  Future<Either<Exception, void>> deleteOutcome({required String outcomeId});
}
