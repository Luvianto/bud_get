import 'package:bud_get/common/data/local/service/shared_prefs_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sharedPrefsServiceProvider = Provider((ref) {
  final SharedPrefsService prefsService = SharedPrefsService();
  prefsService.init();
  return prefsService;
});
