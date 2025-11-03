import 'package:bud_get/chore/handler/data_response.dart';
import 'package:bud_get/chore/handler/either.dart';
import 'package:bud_get/module/outcome/model/outcome_model.dart';

abstract class OutcomeRepository {
  Future<Either<Exception, DataResponse>> fetchOutcomeList({required int skip});
  Future<Either<Exception, DataResponse>> storeOutcome({
    required OutcomeModel outcomeModel,
  });
  Future<Either<Exception, DataResponse>> updateOutcome({
    required OutcomeModel outcomeModel,
  });
  Future<Either<Exception, void>> destroyOutcome({required String outcomeId});
}
