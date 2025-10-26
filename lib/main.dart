import 'package:flutter/material.dart';
import 'package:flutter_todo_app/future/drawer_home/drawer_home.dart';
import 'package:flutter_todo_app/future/splash/splash_view.dart';
import 'package:flutter_todo_app/future/splash/update_version_view.dart';

import 'package:flutter_todo_app/product/enum/drawer_enum.dart';
import 'package:flutter_todo_app/product/init/app_initialize.dart';
import 'package:flutter_todo_app/product/init/state_initialize.dart';

import 'package:go_router/go_router.dart';

part 'product/navigation/app_gorouter.dart';

Future<void> main() async {
  await AppInitialize().make();
  runApp(const StateInitialize(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'TodoApp',
      routerConfig: _router,
    );
  }
}
