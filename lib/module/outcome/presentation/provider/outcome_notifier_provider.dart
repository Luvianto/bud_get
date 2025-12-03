import 'package:bud_get/module/outcome/presentation/provider/state/outcome_notifier.dart';
import 'package:bud_get/module/outcome/presentation/provider/state/outcome_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final outcomeNotifierProvider = NotifierProvider<OutcomeNotifier, OutcomeState>(
  OutcomeNotifier.new,
);
