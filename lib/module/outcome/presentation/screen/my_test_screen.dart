import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MyTestScreen extends ConsumerStatefulWidget {
  const MyTestScreen({super.key});

  @override
  ConsumerState<MyTestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<MyTestScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Hello World')));
  }
}
