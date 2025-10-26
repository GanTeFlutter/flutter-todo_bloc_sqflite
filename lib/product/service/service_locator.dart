import 'package:flutter_todo_app/product/service/services/app_micro_services/categoriy_id_services.dart';
import 'package:flutter_todo_app/product/service/services/log/logger_service.dart';
import 'package:flutter_todo_app/product/service/services/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_todo_app/product/service/services/sqflite/sqflite_init.dart';
import 'package:flutter_todo_app/product/service/services/sqflite/sqflite_service.dart';
import 'package:flutter_todo_app/product/service/services/version/version_maneger_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  _registerSingletons();
  _registerLazySingletons();
  await _initializeServices();
}

Future<void> _initializeServices() async {
  await locator<SharedPreferencesService>().init();
  await locator<SqfliteInitService>().database;
}

void _registerSingletons() {
  locator
    ..registerSingleton<LoggerService>(LoggerService())
    ..registerSingleton<SqfliteInitService>(SqfliteInitService())
    ..registerSingleton<VersionManagerService>(VersionManagerService())
    ..registerSingleton<SharedPreferencesService>(SharedPreferencesService())
    ..registerSingleton(
      CategoryIdService(locator<SharedPreferencesService>()),
    );
}

void _registerLazySingletons() {
  locator.registerLazySingleton<SqfliteService>(
    () => SqfliteService(locator<SqfliteInitService>()),
  );
}

extension ServiceLocator on GetIt {
  LoggerService get logger => locator<LoggerService>();
  SqfliteService get sqflite => locator<SqfliteService>();
  SharedPreferencesService get sharedprefs =>
      locator<SharedPreferencesService>();
  VersionManagerService get versionManager => locator<VersionManagerService>();
  CategoryIdService get categoryIdService => locator<CategoryIdService>();
}




























// final GetIt locator = GetIt.instance;

// void setupLocator() {
//   _registerSingletons();
//   _registerLazySingletons();
//   // _registerFactories();
// }

// void _registerSingletons() {
//   locator
//     ..registerSingleton<LoggerService>(LoggerService())
//     ..registerSingleton<SqfliteInitService>(SqfliteInitService())
//     ..registerSingleton<VersionManagerService>(VersionManagerService())
//     ..registerSingleton<SharedPreferencesService>(
//       SharedPreferencesService(),
//     ); // Bunu ekle
// }

// void _registerLazySingletons() {
//   locator.registerLazySingleton<SqfliteService>(
//     () => SqfliteService(locator<SqfliteInitService>()),
//   );
// }

// extension ServiceLocator on GetIt {
//   LoggerService get logger => locator<LoggerService>();
//   SqfliteService get sqflite => locator<SqfliteService>();
//   SharedPreferencesService get prefs => locator<SharedPreferencesService>();
//   VersionManagerService get versionManager => locator<VersionManagerService>();
// }

// Kullanim
// locator.logger.i("Uygulama başladı");
// locator.supabase.addRandomUser();



// final GetIt locator = GetIt.instance;

// Future<void> setupLocator() async {
//   _registerSingletons();
//   _registerLazySingletons();
//   await _initializeServices();
// }

// void _registerSingletons() {
//   locator
//     ..registerSingleton<LoggerService>(LoggerService())
//     ..registerSingleton<SqfliteInitService>(SqfliteInitService())
//     ..registerSingleton<VersionManagerService>(VersionManagerService())
//     ..registerSingleton<SharedPreferencesService>(SharedPreferencesService());
// }

// void _registerLazySingletons() {
//   locator.registerLazySingleton<SqfliteService>(
//     () => SqfliteService(locator<SqfliteInitService>()),
//   );
// }

// Future<void> _initializeServices() async {
//   // Init gerektiren servisleri başlat
//   await locator<SharedPreferencesService>().init();
//   await locator<SqfliteInitService>().database;
// }

// extension ServiceLocator on GetIt {
//   LoggerService get logger => locator<LoggerService>();
//   SqfliteService get sqflite => locator<SqfliteService>();
//   SharedPreferencesService get prefs => locator<SharedPreferencesService>();
//   VersionManagerService get versionManager => locator<VersionManagerService>();
// }

// /// Kullanim
// /// locator.logger.i("Uygulama başladı");
// /// locator.prefs.setString('username', 'John');
// /// locator.sqflite.getAllTodos();
























// import 'package:flutter_todo_app/product/service/services/log/logger_service.dart';
// import 'package:flutter_todo_app/product/service/services/shared_preferences/shared_preferences_service.dart';
// import 'package:flutter_todo_app/product/service/services/sqflite/sqflite_init.dart';
// import 'package:flutter_todo_app/product/service/services/sqflite/sqflite_service.dart';
// import 'package:flutter_todo_app/product/service/services/version/version_maneger_service.dart';
// import 'package:get_it/get_it.dart';

// final GetIt locator = GetIt.instance;

// void setupLocator() {
//   _registerSingletons();
//   _registerLazySingletons();
//   // _registerFactories();
// }

// void _registerSingletons() {
//   locator
//     ..registerSingleton<LoggerService>(LoggerService())
//     ..registerSingleton<SqfliteInitService>(SqfliteInitService())
//     ..registerSingleton<VersionManagerService>(VersionManagerService())
//     ..registerSingleton<SharedPreferencesService>(
//       SharedPreferencesService(),
//     ); // Bunu ekle
// }

// void _registerLazySingletons() {
//   locator.registerLazySingleton<SqfliteService>(
//     () => SqfliteService(locator<SqfliteInitService>()),
//   );
// }

// extension ServiceLocator on GetIt {
//   LoggerService get logger => locator<LoggerService>();
//   SqfliteService get sqflite => locator<SqfliteService>();
//   SharedPreferencesService get prefs => locator<SharedPreferencesService>();
//   VersionManagerService get versionManager => locator<VersionManagerService>();
// }




// final GetIt locator = GetIt.instance;

// Future<void> setupLocator() async {
//   _registerSingletons();
//   _registerLazySingletons();
//   await _initializeServices();
// }

// void _registerSingletons() {
//   locator
//     ..registerSingleton<LoggerService>(LoggerService())
//     ..registerSingleton<SqfliteInitService>(SqfliteInitService())
//     ..registerSingleton<VersionManagerService>(VersionManagerService())
//     ..registerSingleton<SharedPreferencesService>(SharedPreferencesService());
// }

// void _registerLazySingletons() {
//   locator.registerLazySingleton<SqfliteService>(
//     () => SqfliteService(locator<SqfliteInitService>()),
//   );
// }

// Future<void> _initializeServices() async {
//   // Init gerektiren servisleri başlat
//   await locator<SharedPreferencesService>().init();
//   await locator<SqfliteInitService>().database;
// }

// extension ServiceLocator on GetIt {
//   LoggerService get logger => locator<LoggerService>();
//   SqfliteService get sqflite => locator<SqfliteService>();
//   SharedPreferencesService get prefs => locator<SharedPreferencesService>();
//   VersionManagerService get versionManager => locator<VersionManagerService>();
// }

// /// Kullanim
// /// locator.logger.i("Uygulama başladı");
// /// locator.prefs.setString('username', 'John');
// /// locator.sqflite.getAllTodos();
