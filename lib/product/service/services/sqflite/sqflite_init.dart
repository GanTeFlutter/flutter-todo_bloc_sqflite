import 'dart:io';

import 'package:flutter_todo_app/product/service/service_locator.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqfliteInitService {
  static const String dbName = 'app_database.db';
  static const int dbVersion = 1;
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Veritabanını başlatır ve açar
  /// Bu metod sadece bir kez çağrılır (lazy initialization)
  Future<Database> _initDatabase() async {
    try {
      // Veritabanının saklanacağı dizini al
      // Android: /data/data/package_name/databases/
      // iOS: Documents folder
      final databasesPath = await getDatabasesPath();
      // Dizinin var olduğundan emin ol, yoksa oluştur
      // recursive: true -> parent dizinleri de oluşturur
      await Directory(databasesPath).create(recursive: true);
      // Tam veritabanı yolunu oluştur
      // join() platform-bağımsız yol birleştirme sağlar (/, \ sorunlarını önler)
      final path = join(databasesPath, dbName);
      // Veritabanını aç ve yapılandır
      final database = await openDatabase(
        path,
        version: dbVersion,
        // İlk kez veritabanı oluşturulduğunda çağrılır
        // Tabloları ve initial data'yı burada oluşturabilirsin
        onCreate: _onCreate,
        // Veritabanı versiyonu yükseltildiğinde çağrılır
        // Schema değişikliklerini (ALTER TABLE, etc.) burada yap
        onUpgrade: _onUpgrade,
        // Veritabanı açılmadan önce çağrılır
        // Foreign key desteği gibi PRAGMA ayarları için kullanılır
        onConfigure: _onConfigure,
        // Veritabanı açıldıktan sonra çağrılır
        // Debug log, versiyon kontrolü için kullanılabilir
        onOpen: _onOpen,
      );

      locator.logger.i('Database initialized successfully at: $path');
      return database;
    } on Exception catch (e) {
      locator.logger.e('Error initializing database: $e');
      rethrow; // Hatayı yukarı fırlat, uygulama bunu handle edebilir
    }
  }

  /// Veritabanı ilk oluşturulduğunda çağrılır
  /// Tabloları burada oluştur
  Future<void> _onCreate(Database db, int version) async {
    locator.logger.i('Creating database tables...');

    // Kategoriler tablosu
    await db.execute('''
  CREATE TABLE categories(
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  colorCode INTEGER NOT NULL
  )
  ''');

    // tablosu oluşturma
    await db.execute('''
  CREATE TABLE todos(
   id TEXT PRIMARY KEY,
   title TEXT NOT NULL,
   description TEXT NOT NULL,
   isCompleted INTEGER NOT NULL,
   createdAt TEXT NOT NULL,
   hasReminder INTEGER NOT NULL,
   priority INTEGER NOT NULL,
   categoryId TEXT, -- kategori tablosuna referans
   updatedAt TEXT,
   reminderTime TEXT,
   colorCode INTEGER,
   FOREIGN KEY (categoryId) REFERENCES categories(id) ON DELETE SET NULL
  )
 ''');

    // Daha fazla tablo ekleyebilirsin
    // await db.execute('CREATE TABLE categories(...)');

    locator.logger.i('Database tables created successfully');
  }

  /// Veritabanı versiyonu yükseltildiğinde çağrılır
  /// Schema migration işlemlerini burada yap
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    locator.logger.i('Upgrading database from v$oldVersion to v$newVersion');

    // Version bazlı migration stratejisi
    if (oldVersion < 2) {
      // Versiyon 2'ye upgrade: yeni kolon ekle
      // await db.execute('ALTER TABLE todos ADD COLUMN priority INTEGER');
    }

    if (oldVersion < 3) {
      // Versiyon 3'e upgrade: yeni tablo ekle
      // await db.execute('CREATE TABLE categories(...)');
    }

    locator.logger.i('Database upgrade completed');
  }

  /// Veritabanı açılmadan önce yapılandırma
  /// Foreign key constraints gibi PRAGMA ayarları
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
    locator.logger.i('Database configured');
  }

  /// Veritabanı başarıyla açıldığında çağrılır
  Future<void> _onOpen(Database db) async {
    final version = await db.getVersion();
    locator.logger.i('Database opened successfully - Version: $version');
  }

  /// Veritabanını kapat
  /// Uygulama kapanırken veya logout durumlarında kullanılabilir
  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
      locator.logger.i('Database closed');
    }
  }

  /// Veritabanını tamamen sil
  /// Dikkatli kullan! Tüm data kaybolur
  Future<void> deleteDatabase() async {
    try {
      final databasesPath = await getDatabasesPath();
      final path = join(databasesPath, dbName);

      // Önce aç olan bağlantıyı kapat
      await close();

      // Dosyayı sil
      await databaseFactory.deleteDatabase(path);

      locator.logger.i('Database deleted successfully');
    } on Exception catch (e) {
      locator.logger.e('Error deleting database: $e');
      rethrow;
    }
  }
}
