import 'package:bud_get/common/theme/app_color.dart';
import 'package:bud_get/common/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class TextThemes {
  /// Main text theme

  static TextTheme get textTheme {
    return const TextTheme(
      bodyLarge: AppTextStyle.bodyLg,
      bodyMedium: AppTextStyle.body,
      titleMedium: AppTextStyle.bodySm,
      titleSmall: AppTextStyle.bodyXs,
      displayLarge: AppTextStyle.h1,
      displayMedium: AppTextStyle.h2,
      displaySmall: AppTextStyle.h3,
      headlineMedium: AppTextStyle.h4,
    );
  }

  /// Dark text theme

  static TextTheme get darkTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyle.bodyLg.copyWith(color: AppColor.white),
      bodyMedium: AppTextStyle.body.copyWith(color: AppColor.white),
      titleMedium: AppTextStyle.bodySm.copyWith(color: AppColor.white),
      titleSmall: AppTextStyle.bodyXs.copyWith(color: AppColor.white),
      displayLarge: AppTextStyle.h1.copyWith(color: AppColor.white),
      displayMedium: AppTextStyle.h2.copyWith(color: AppColor.white),
      displaySmall: AppTextStyle.h3.copyWith(color: AppColor.white),
      headlineMedium: AppTextStyle.h4.copyWith(color: AppColor.white),
    );
  }

  /// Primary text theme

  static TextTheme get primaryTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyle.bodyLg.copyWith(color: AppColor.primary),
      bodyMedium: AppTextStyle.body.copyWith(color: AppColor.primary),
      titleMedium: AppTextStyle.bodySm.copyWith(color: AppColor.primary),
      titleSmall: AppTextStyle.bodyXs.copyWith(color: AppColor.primary),
      displayLarge: AppTextStyle.h1.copyWith(color: AppColor.primary),
      displayMedium: AppTextStyle.h2.copyWith(color: AppColor.primary),
      displaySmall: AppTextStyle.h3.copyWith(color: AppColor.primary),
      headlineMedium: AppTextStyle.h4.copyWith(color: AppColor.primary),
    );
  }
}
