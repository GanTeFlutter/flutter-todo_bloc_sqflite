// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => _TodoModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  isCompleted: (json['isCompleted'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  hasReminder: (json['hasReminder'] as num).toInt(),
  priority: (json['priority'] as num).toInt(),
  categoryId: json['categoryId'] as String?,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  reminderTime: json['reminderTime'] == null
      ? null
      : DateTime.parse(json['reminderTime'] as String),
  colorCode: (json['colorCode'] as num?)?.toInt(),
);

Map<String, dynamic> _$TodoModelToJson(_TodoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'hasReminder': instance.hasReminder,
      'priority': instance.priority,
      'categoryId': instance.categoryId,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'reminderTime': instance.reminderTime?.toIso8601String(),
      'colorCode': instance.colorCode,
    };
