import 'package:bud_get/common/data/local/datasource/storage_datasource.dart';
import 'package:bud_get/common/domain/shared_prefs_service_provider.dart';
import 'package:bud_get/common/theme/app_color.dart';
import 'package:bud_get/common/theme/app_text_style.dart';
import 'package:bud_get/common/theme/text_theme.dart';
import 'package:bud_get/common/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = NotifierProvider<AppThemeModeNotifier, ThemeMode>(
  () => AppThemeModeNotifier(),
);

class AppThemeModeNotifier extends Notifier<ThemeMode> {
  late final StorageDatasource storageDatasource;

  @override
  ThemeMode build() {
    storageDatasource = ref.read(sharedPrefsServiceProvider);
    _loadTheme();
    return ThemeMode.light;
  }

  Future<void> _loadTheme() async {
    final theme = await storageDatasource.get(APP_THEME_STORAGE_KEY);
    final value = ThemeMode.values.byName('${theme ?? 'light'}');
    state = value;
  }

  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    storageDatasource.set(APP_THEME_STORAGE_KEY, state.name);
  }
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppTextStyle.fontFamily,
      primaryColor: AppColor.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColor.primary,
        secondary: AppColor.lightGrey,
        error: AppColor.error,
        surface: AppColor.black,
      ),
      scaffoldBackgroundColor: AppColor.black,
      textTheme: TextThemes.darkTextTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColor.black,
        titleTextStyle: AppTextStyle.h2,
      ),
    );
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColor.primary,
      textTheme: TextThemes.textTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      colorScheme: const ColorScheme.light(
        primary: AppColor.primary,
        secondary: AppColor.lightGrey,
        error: AppColor.error,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColor.primary,
      ),
    );
  }
}
