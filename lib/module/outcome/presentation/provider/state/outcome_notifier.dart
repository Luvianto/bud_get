import 'package:bud_get/chore/handler/either.dart';
import 'package:bud_get/module/outcome/domain/provider/outcome_provider.dart';
import 'package:bud_get/module/outcome/model/outcome_model.dart';
import 'package:bud_get/module/outcome/presentation/provider/state/outcome_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OutcomeNotifier extends Notifier<OutcomeState> {
  @override
  OutcomeState build() => const OutcomeState.initial();

  bool get isFetching =>
      state.state != OutcomeConcreteState.loading &&
      state.state != OutcomeConcreteState.fetchingMore;

  Future<void> fetchOutcomeList() async {
    if (isFetching &&
        state.state != OutcomeConcreteState.fetchedAllOutcomeModels) {
      state = state.copyWith(
        state: state.page > 0
            ? OutcomeConcreteState.fetchingMore
            : OutcomeConcreteState.loading,
        isLoading: true,
      );

      final response = await ref
          .read(outcomeRepositoryProvider)
          .getOutcomeList();

      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: OutcomeConcreteState.fetchedAllOutcomeModels,
        message: 'No more products available',
        isLoading: false,
      );
    }
  }

  void updateStateFromResponse(
    Either<Exception, List<Map<String, dynamic>>> response,
  ) {
    response.fold(
      (e) {
        state = state.copyWith(
          state: OutcomeConcreteState.failure,
          message: e.toString(),
          isLoading: false,
        );
      },
      (data) {
        final outcomeList = data.map((e) => OutcomeModel.fromJson(e)).toList();

        final totalProducts = [...state.outcomeList, ...outcomeList];

        state = state.copyWith(
          outcomeList: totalProducts,
          state: totalProducts.length == data.length
              ? OutcomeConcreteState.fetchedAllOutcomeModels
              : OutcomeConcreteState.loaded,
          hasData: true,
          message: totalProducts.isEmpty ? 'No products found' : '',
          page: totalProducts.length ~/ 10,
          total: data.length,
          isLoading: false,
        );
      },
    );
  }

  void resetState() {
    state = const OutcomeState.initial();
  }
}
