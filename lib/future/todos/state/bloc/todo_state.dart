part of 'todo_bloc.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = _Initial;

  //yükleniyor durumu
  const factory TodoState.loading() = _Loading;

  //veriler yüklendi
  const factory TodoState.loaded({
    required List<CategoryModel> categories,
    required List<TodoModel> todos,
    @Default('all') String selectedCategoryId,
  }) = _Loaded;

  const factory TodoState.error(String message) = _Error;
}
