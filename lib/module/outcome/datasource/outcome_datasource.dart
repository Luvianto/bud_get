import 'package:bud_get/chore/handler/either.dart';
import 'package:bud_get/module/outcome/model/outcome_model.dart';

abstract class OutcomeDatasource {
  Future<Either<Exception, List<OutcomeModel>>> getOutcomes();
  Future<Either<Exception, OutcomeModel>> createOutcome(
    OutcomeModel outcomeModel,
  );
  Future<Either<Exception, OutcomeModel>> updateOutcome(
    OutcomeModel outcomeModel,
  );
  Future<Either<Exception, void>> deleteOutcome(String outcomeId);
}
