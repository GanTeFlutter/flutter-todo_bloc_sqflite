part of 'todo_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  //uygulama başlatıldığında
  const factory TodoEvent.started() = _Started;

  //kategori seçimi
  const factory TodoEvent.selectCategory(String categoryId) = _SelectCategory;

  //kategori ekle ve silme
  const factory TodoEvent.addCategory(CategoryModel category) = _AddCategory;
  const factory TodoEvent.deleteCategory(String categoryId) = _DeleteCategory;

  //not ekle, sil ve güncelle
  const factory TodoEvent.addTodo(TodoModel todo) = _AddTodo;
  const factory TodoEvent.deleteTodo(String todoId) = _DeleteTodo;
  const factory TodoEvent.updateTodo(TodoModel todo) = _UpdateTodo;
}
