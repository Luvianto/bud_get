import 'package:bud_get/main/app.dart';
import 'package:bud_get/main/env_config.dart';
import 'package:bud_get/main/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => initializeApp(Environment.development);

Future<void> initializeApp(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();

  AppEnv.initialize(env);

  // SystemChrome is a Flutter API that controls system-level UI
  // (status bar, nav bar, etc.)
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(ProviderScope(observers: [Observer()], child: MainApp()));

  await Future.delayed(const Duration(seconds: 2));
}
