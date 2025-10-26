import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
abstract class TodoModel with _$TodoModel {
  const factory TodoModel({
    // Zorunlu alanlar
    required String id,
    required String title,
    required String description,
    required int isCompleted,
    required DateTime createdAt,
    required int hasReminder,
    required int priority,

    // İsteğe bağlı alanlar
    String? categoryId,
    DateTime? updatedAt,
    DateTime? reminderTime,
    int? colorCode,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, Object?> json) =>
      _$TodoModelFromJson(json);
}
