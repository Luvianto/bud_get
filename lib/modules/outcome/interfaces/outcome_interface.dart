import 'package:bud_get/common/models/either.dart';
import 'package:bud_get/modules/outcome/models/outcome_model.dart';

abstract class OutcomeInterface {
  Future<Either<Exception, List<OutcomeModel>>> getOutcomes();
  Future<Either<Exception, OutcomeModel>> createOutcome(
    OutcomeModel outcomeModel,
  );
  Future<Either<Exception, OutcomeModel>> updateOutcome(
    OutcomeModel outcomeModel,
  );
  Future<Either<Exception, void>> deleteOutcome(String outcomeId);
}
