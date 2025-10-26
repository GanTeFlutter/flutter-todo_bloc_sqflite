// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoModel {

// Zorunlu alanlar
 String get id; String get title; String get description; int get isCompleted; DateTime get createdAt; int get hasReminder; int get priority;// İsteğe bağlı alanlar
 String? get categoryId; DateTime? get updatedAt; DateTime? get reminderTime; int? get colorCode;
/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoModelCopyWith<TodoModel> get copyWith => _$TodoModelCopyWithImpl<TodoModel>(this as TodoModel, _$identity);

  /// Serializes this TodoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.hasReminder, hasReminder) || other.hasReminder == hasReminder)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.reminderTime, reminderTime) || other.reminderTime == reminderTime)&&(identical(other.colorCode, colorCode) || other.colorCode == colorCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,isCompleted,createdAt,hasReminder,priority,categoryId,updatedAt,reminderTime,colorCode);

@override
String toString() {
  return 'TodoModel(id: $id, title: $title, description: $description, isCompleted: $isCompleted, createdAt: $createdAt, hasReminder: $hasReminder, priority: $priority, categoryId: $categoryId, updatedAt: $updatedAt, reminderTime: $reminderTime, colorCode: $colorCode)';
}


}

/// @nodoc
abstract mixin class $TodoModelCopyWith<$Res>  {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) _then) = _$TodoModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, int isCompleted, DateTime createdAt, int hasReminder, int priority, String? categoryId, DateTime? updatedAt, DateTime? reminderTime, int? colorCode
});




}
/// @nodoc
class _$TodoModelCopyWithImpl<$Res>
    implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._self, this._then);

  final TodoModel _self;
  final $Res Function(TodoModel) _then;

/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? isCompleted = null,Object? createdAt = null,Object? hasReminder = null,Object? priority = null,Object? categoryId = freezed,Object? updatedAt = freezed,Object? reminderTime = freezed,Object? colorCode = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,hasReminder: null == hasReminder ? _self.hasReminder : hasReminder // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reminderTime: freezed == reminderTime ? _self.reminderTime : reminderTime // ignore: cast_nullable_to_non_nullable
as DateTime?,colorCode: freezed == colorCode ? _self.colorCode : colorCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoModel].
extension TodoModelPatterns on TodoModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoModel value)  $default,){
final _that = this;
switch (_that) {
case _TodoModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoModel value)?  $default,){
final _that = this;
switch (_that) {
case _TodoModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  int isCompleted,  DateTime createdAt,  int hasReminder,  int priority,  String? categoryId,  DateTime? updatedAt,  DateTime? reminderTime,  int? colorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isCompleted,_that.createdAt,_that.hasReminder,_that.priority,_that.categoryId,_that.updatedAt,_that.reminderTime,_that.colorCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  int isCompleted,  DateTime createdAt,  int hasReminder,  int priority,  String? categoryId,  DateTime? updatedAt,  DateTime? reminderTime,  int? colorCode)  $default,) {final _that = this;
switch (_that) {
case _TodoModel():
return $default(_that.id,_that.title,_that.description,_that.isCompleted,_that.createdAt,_that.hasReminder,_that.priority,_that.categoryId,_that.updatedAt,_that.reminderTime,_that.colorCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  int isCompleted,  DateTime createdAt,  int hasReminder,  int priority,  String? categoryId,  DateTime? updatedAt,  DateTime? reminderTime,  int? colorCode)?  $default,) {final _that = this;
switch (_that) {
case _TodoModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isCompleted,_that.createdAt,_that.hasReminder,_that.priority,_that.categoryId,_that.updatedAt,_that.reminderTime,_that.colorCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodoModel implements TodoModel {
  const _TodoModel({required this.id, required this.title, required this.description, required this.isCompleted, required this.createdAt, required this.hasReminder, required this.priority, this.categoryId, this.updatedAt, this.reminderTime, this.colorCode});
  factory _TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);

// Zorunlu alanlar
@override final  String id;
@override final  String title;
@override final  String description;
@override final  int isCompleted;
@override final  DateTime createdAt;
@override final  int hasReminder;
@override final  int priority;
// İsteğe bağlı alanlar
@override final  String? categoryId;
@override final  DateTime? updatedAt;
@override final  DateTime? reminderTime;
@override final  int? colorCode;

/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoModelCopyWith<_TodoModel> get copyWith => __$TodoModelCopyWithImpl<_TodoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.hasReminder, hasReminder) || other.hasReminder == hasReminder)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.reminderTime, reminderTime) || other.reminderTime == reminderTime)&&(identical(other.colorCode, colorCode) || other.colorCode == colorCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,isCompleted,createdAt,hasReminder,priority,categoryId,updatedAt,reminderTime,colorCode);

@override
String toString() {
  return 'TodoModel(id: $id, title: $title, description: $description, isCompleted: $isCompleted, createdAt: $createdAt, hasReminder: $hasReminder, priority: $priority, categoryId: $categoryId, updatedAt: $updatedAt, reminderTime: $reminderTime, colorCode: $colorCode)';
}


}

/// @nodoc
abstract mixin class _$TodoModelCopyWith<$Res> implements $TodoModelCopyWith<$Res> {
  factory _$TodoModelCopyWith(_TodoModel value, $Res Function(_TodoModel) _then) = __$TodoModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, int isCompleted, DateTime createdAt, int hasReminder, int priority, String? categoryId, DateTime? updatedAt, DateTime? reminderTime, int? colorCode
});




}
/// @nodoc
class __$TodoModelCopyWithImpl<$Res>
    implements _$TodoModelCopyWith<$Res> {
  __$TodoModelCopyWithImpl(this._self, this._then);

  final _TodoModel _self;
  final $Res Function(_TodoModel) _then;

/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? isCompleted = null,Object? createdAt = null,Object? hasReminder = null,Object? priority = null,Object? categoryId = freezed,Object? updatedAt = freezed,Object? reminderTime = freezed,Object? colorCode = freezed,}) {
  return _then(_TodoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,hasReminder: null == hasReminder ? _self.hasReminder : hasReminder // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reminderTime: freezed == reminderTime ? _self.reminderTime : reminderTime // ignore: cast_nullable_to_non_nullable
as DateTime?,colorCode: freezed == colorCode ? _self.colorCode : colorCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
