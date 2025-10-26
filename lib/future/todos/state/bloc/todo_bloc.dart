import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/future/todos/state/bloc_helper_service.dart';
import 'package:flutter_todo_app/product/service/service_locator.dart';
import 'package:flutter_todo_app/product/service/services/sqflite/sqflite_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gen/gen.dart';
part 'todo_event.dart';
part 'todo_state.dart';
part 'todo_bloc.freezed.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(
    this._sqfliteService,
    this._blocHelperService,
  ) : super(const _Initial()) {
    on<_Started>(_started);
    on<_SelectCategory>(_selectCategory);
    on<_AddCategory>(_executeOperation);
    on<_DeleteCategory>(_executeOperation);
    on<_AddTodo>(_addTodoWithCategorySwitch);
    on<_DeleteTodo>(_executeOperation);
    on<_UpdateTodo>(_executeOperation);

    add(const TodoEvent.started());
  }

  late final SqfliteService _sqfliteService;
  late final BlocHelperService _blocHelperService;

  Future<void> _started(_Started event, Emitter<TodoState> emit) async {
    emit(const TodoState.loading());
    try {
      final categories = await _sqfliteService.getCategories();
      final todos = await _sqfliteService.getTodos();

      locator.logger.d('Kategoriler yüklendi: ${categories.length} adet');
      locator.logger.d('Todolar yüklendi: ${todos.length} adet');

      // Cache'den kayitli kategori bilgisini aliyoruz
      var selectedCategoryId = _blocHelperService.getCachedSelectedCategory();

      // Eğer cache'de kategori yoksa veya 'boss' ise, 'all' yap
      if (selectedCategoryId == null || selectedCategoryId.isEmpty) {
        selectedCategoryId = 'all';
        _blocHelperService.cacheSelectedCategory(selectedCategoryId);
      }

      // Seçili kategoriye göre filtreleme
      final filteredTodos = _filterTodosByCategory(todos, selectedCategoryId);

      locator.logger.d('Seçili kategori: $selectedCategoryId');
      locator.logger.d('Filtrelenmiş todolar: ${filteredTodos.length} adet');

      emit(
        TodoState.loaded(
          categories: categories,
          todos: filteredTodos,
          selectedCategoryId: selectedCategoryId,
        ),
      );
    } on Exception catch (e) {
      locator.logger.e('TodoBloc _started Hatası: $e');
      emit(TodoState.error('Bir hata oluştu: $e'));
    }
  }

  Future<void> _selectCategory(
    _SelectCategory event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final categoryId = event.categoryId;
      _blocHelperService.cacheSelectedCategory(categoryId);

      // Her zaman güncel verileri veritabanından çek
      final categories = await _sqfliteService.getCategories();
      final allTodos = await _sqfliteService.getTodos();
      final filteredTodos = _filterTodosByCategory(allTodos, categoryId);

      locator.logger.i(
        'Kategori değiştirildi: $categoryId, '
        'Kategori sayısı: ${categories.length}, '
        'Todo sayısı: ${filteredTodos.length}',
      );

      emit(
        TodoState.loaded(
          categories: categories,
          todos: filteredTodos,
          selectedCategoryId: categoryId,
        ),
      );
    } on Exception catch (e) {
      locator.logger.e('TodoBloc _selectCategory Hatası: $e');
    }
  }

  // AddTodo için özel handler - Eklenen notun kategorisini seçer
  Future<void> _addTodoWithCategorySwitch(
    _AddTodo event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final todo = event.todo;

      // 1. Todo'yu veritabanına ekle
      await _sqfliteService.insertTodo(todo);
      locator.logger.d(
        'Todo eklendi: ${todo.title} (Kategori: ${todo.categoryId})',
      );

      // 2. Eklenen todo'nun kategorisini cache'e kaydet
      _blocHelperService.cacheSelectedCategory(todo.categoryId!);

      // 3. Tüm verileri yeniden yükle ve eklenen kategoriye geç
      final categories = await _sqfliteService.getCategories();
      final todos = await _sqfliteService.getTodos();

      // Eklenen todo'nun kategorisine göre filtrele
      final filteredTodos = _filterTodosByCategory(todos, todo.categoryId!);

      locator.logger.i(
        'Todo eklendi ve kategori değiştirildi: ${todo.categoryId}',
      );

      emit(
        TodoState.loaded(
          categories: categories,
          todos: filteredTodos,
          selectedCategoryId: todo.categoryId!,
        ),
      );
    } on Exception catch (e) {
      locator.logger.e('TodoBloc addTodo Hatası: $e');
    }
  }

  Future<void> _executeOperation(
    TodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      String? categoryToSelect;

      switch (event) {
        case _AddCategory(:final category):
          await _sqfliteService.insertCategory(category);
          locator.logger.d('Kategori eklendi: ${category.name}');
          // Yeni eklenen kategoriye geç
          categoryToSelect = category.id;
        case _DeleteCategory(:final categoryId):
          await _sqfliteService.deleteCategory(categoryId);
          locator.logger.d('Kategori silindi: $categoryId');
          // Silinen kategori seçiliyse 'all'a geç
          final currentState = state;
          if (currentState is _Loaded &&
              currentState.selectedCategoryId == categoryId) {
            categoryToSelect = 'all';
          }
        case _DeleteTodo(:final todoId):
          await _sqfliteService.deleteTodo(todoId);
          locator.logger.d('Todo silindi: $todoId');
        case _UpdateTodo(:final todo):
          await _sqfliteService.updateTodo(todo);
          locator.logger.d('Todo güncellendi: ${todo.title}');
        default:
          return;
      }

      // Mevcut seçili kategoriyi koru ve verileri yenile
      final currentState = state;
      if (currentState is _Loaded) {
        // Eğer özel bir kategori belirtilmişse onu seç, yoksa mevcut kategoriyi koru
        final selectedCategory =
            categoryToSelect ?? currentState.selectedCategoryId;
        add(TodoEvent.selectCategory(selectedCategory));
      } else {
        add(const TodoEvent.started());
      }
    } on Exception catch (e) {
      locator.logger.e('TodoBloc ${event.runtimeType} Hatası: $e');
    }
  }

  // Yardımcı fonksiyon: Kategoriye göre filtreleme
  List<TodoModel> _filterTodosByCategory(
    List<TodoModel> todos,
    String categoryId,
  ) {
    // 'all' seçiliyse tüm todoları döndür
    if (categoryId == 'all' || categoryId.isEmpty) {
      return todos;
    }

    // Belirli bir kategoriye ait todoları filtrele
    return todos.where((todo) => todo.categoryId == categoryId).toList();
  }
}
