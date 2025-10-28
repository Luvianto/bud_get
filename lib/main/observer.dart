import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';

base class Observers extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    log(
      '${context.provider.name ?? context.provider.runtimeType} = $newValue',
      name: 'Riverpod',
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    log(
      '${context.provider.name ?? context.provider.runtimeType} Disposed',
      name: 'Riverpod',
    );
    super.didDisposeProvider(context);
  }
}
