import 'package:bud_get/module/outcome/model/outcome_model.dart';
import 'package:equatable/equatable.dart';

enum OutcomeConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllOutcomes,
}

// Equatable class compare objects/instance created on class by value, not by memory address.
// Therefor Riverpod will only rebuild if the value changes, not the memory address.
class OutcomeState extends Equatable {
  final List<OutcomeModel> outcomeList;
  final int total;
  final int page;
  final bool hasData;
  final OutcomeConcreteState state;
  final String message;
  final bool isLoading;

  const OutcomeState({
    this.outcomeList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = OutcomeConcreteState.initial,
    this.message = '',
    this.page = 0,
    this.total = 0,
  });

  const OutcomeState.initial({
    this.outcomeList = const [],
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.state = OutcomeConcreteState.initial,
    this.message = '',
  });

  OutcomeState copyWith({
    List<OutcomeModel>? outcomeList,
    int? total,
    int? page,
    bool? hasData,
    OutcomeConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return OutcomeState(
      isLoading: isLoading ?? this.isLoading,
      outcomeList: outcomeList ?? this.outcomeList,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'OutcomeState(isLoading:$isLoading, OutcomeModelLength: ${outcomeList.length},total:$total page: $page, hasData: $hasData, state: $state, message: $message)';
  }

  @override
  List<Object?> get props => [outcomeList, page, hasData, state, message];
}
