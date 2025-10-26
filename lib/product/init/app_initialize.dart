import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/product/service/service_locator.dart';

@immutable
final class AppInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded(_initialize, (error, stack) {
      locator.logger.e('AppInitialize error: $error');
    });
  }

  Future<void> _initialize() async {
    await setupLocator();
  }
}
