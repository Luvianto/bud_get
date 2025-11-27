import 'package:bud_get/chore/handler/either.dart';
import 'package:bud_get/module/outcome/model/outcome_model.dart';

abstract class OutcomeRepository {
  Future<Either<Exception, List<Map<String, dynamic>>>> getOutcomeList();
  Future<Either<Exception, Map<String, dynamic>>> createOutcome({
    required OutcomeModel outcomeModel,
  });
  Future<Either<Exception, Map<String, dynamic>>> editOutcome({
    required OutcomeModel outcomeModel,
  });
  Future<Either<Exception, int>> deleteOutcome({required int id});
}
