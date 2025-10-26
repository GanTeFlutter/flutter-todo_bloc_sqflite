
import 'package:flutter_todo_app/product/service/service_locator.dart';
import 'package:flutter_todo_app/product/service/services/sqflite/sqflite_init.dart';
import 'package:gen/gen.dart';
import 'package:sqflite/sqflite.dart';


class SqfliteService {
  SqfliteService(this._initService);
  final SqfliteInitService _initService;

  Future<Database> get _db async => _initService.database;

  // ----------------------------------------------------------
  // CATEGORY CRUD
  // ----------------------------------------------------------

  Future<void> insertCategory(CategoryModel category) async {
    try {
      final db = await _db;
      await db.insert(
        'categories',
        category.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      locator.logger.i('Category inserted: ${category.name}');
    } on DatabaseException catch (e) {
      locator.logger.e('Database error inserting category: $e');
      throw DatabaseOperationException('Failed to insert category', e);
    } on Exception catch (e) {
      locator.logger.e('Unexpected error inserting category: $e');
      rethrow;
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final db = await _db;
      final result = await db.query('categories');

      return result.map((json) {
        try {
          return CategoryModel.fromJson(json);
        } catch (e) {
          locator.logger.e('Failed to parse category: $json');
          rethrow;
        }
      }).toList();
    } on DatabaseException catch (e) {
      locator.logger.e('Database error fetching categories: $e');
      return []; // Boş liste döndür, uygulama çökmesin
    } on Exception catch (e) {
      locator.logger.e('Unexpected error fetching categories: $e');
      return [];
    }
  }

  Future<int> deleteCategory(String id) async {
    try {
      final db = await _db;
      final count = await db.delete(
        'categories',
        where: 'id = ?',
        whereArgs: [id],
      );
      locator.logger.i('Category deleted: $id');
      return count;
    } on DatabaseException catch (e) {
      locator.logger.e('Database error deleting category: $e');
      throw DatabaseOperationException('Failed to delete category', e);
    }
  }

  // ----------------------------------------------------------
  //  CRUD
  // ----------------------------------------------------------

  Future<void> insertTodo(TodoModel todo) async {
    try {
      final db = await _db;
      await db.insert(
        'todos',
        todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      locator.logger.i('Todo inserted: ${todo.title}');
    } on DatabaseException catch (e) {
      locator.logger.e('Database error inserting todo: $e');
      throw DatabaseOperationException('Failed to insert todo', e);
    } on Exception catch (e) {
      locator.logger.e('Unexpected error inserting todo: $e');
      rethrow;
    }
  }

  Future<List<TodoModel>> getTodos() async {
    try {
      final db = await _db;
      final result = await db.query('todos');

      return result.map((json) {
        try {
          return TodoModel.fromJson(json);
        } catch (e) {
          locator.logger.e('Failed to parse todo: $json');
          rethrow;
        }
      }).toList();
    } on DatabaseException catch (e) {
      locator.logger.e('Database error fetching todos: $e');
      return [];
    } on Exception catch (e) {
      locator.logger.e('Unexpected error fetching todos: $e');
      return [];
    }
  }

  Future<int> updateTodo(TodoModel todo) async {
    try {
      final db = await _db;
      final count = await db.update(
        'todos',
        todo.toJson(),
        where: 'id = ?',
        whereArgs: [todo.id],
      );
      locator.logger.i('Todo updated: ${todo.id}');
      return count;
    } on DatabaseException catch (e) {
      locator.logger.e('Database error updating todo: $e');
      throw DatabaseOperationException('Failed to update todo', e);
    }
  }

  Future<int> deleteTodo(String id) async {
    try {
      final db = await _db;
      final count = await db.delete(
        'todos',
        where: 'id = ?',
        whereArgs: [id],
      );
      locator.logger.i('Todo deleted: $id');
      return count;
    } on DatabaseException catch (e) {
      locator.logger.e('Database error deleting todo: $e');
      throw DatabaseOperationException('Failed to delete todo', e);
    }
  }

  // ----------------------------------------------------------
  // RELATION (JOIN)
  // ----------------------------------------------------------

  Future<List<Map<String, dynamic>>> getTodosWithCategory() async {
    try {
      final db = await _db;
      final result = await db.rawQuery('''
        SELECT todos.*, categories.name AS categoryName, categories.colorCode AS categoryColor
        FROM todos
        LEFT JOIN categories ON todos.categoryId = categories.id
      ''');
      return result;
    } on DatabaseException catch (e) {
      locator.logger.e('Database error in join query: $e');
      return [];
    } on Exception catch (e) {
      locator.logger.e('Unexpected error in join query: $e');
      return [];
    }
  }
}

// ----------------------------------------------------------
// CUSTOM EXCEPTION
// ----------------------------------------------------------

class DatabaseOperationException implements Exception {
  DatabaseOperationException(this.message, [this.cause]);

  final String message;
  final dynamic cause;

  @override
  String toString() =>
      'DatabaseOperationException: $message${cause != null ? '\nCause: $cause' : ''}';
}
