// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:bud_get/module/outcome/presentation/screen/my_test_screen.dart'
    as _i1;
import 'package:bud_get/module/outcome/presentation/screen/outcome_screen.dart'
    as _i2;

/// generated route for
/// [_i1.MyTestScreen]
class MyTestRoute extends _i3.PageRouteInfo<void> {
  const MyTestRoute({List<_i3.PageRouteInfo>? children})
    : super(MyTestRoute.name, initialChildren: children);

  static const String name = 'MyTestRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.MyTestScreen();
    },
  );
}

/// generated route for
/// [_i2.OutcomeScreen]
class OutcomeRoute extends _i3.PageRouteInfo<void> {
  const OutcomeRoute({List<_i3.PageRouteInfo>? children})
    : super(OutcomeRoute.name, initialChildren: children);

  static const String name = 'OutcomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.OutcomeScreen();
    },
  );
}
