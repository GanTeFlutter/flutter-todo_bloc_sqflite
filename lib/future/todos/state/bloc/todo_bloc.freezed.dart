// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoEvent()';
}


}

/// @nodoc
class $TodoEventCopyWith<$Res>  {
$TodoEventCopyWith(TodoEvent _, $Res Function(TodoEvent) __);
}


/// Adds pattern-matching-related methods to [TodoEvent].
extension TodoEventPatterns on TodoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SelectCategory value)?  selectCategory,TResult Function( _AddCategory value)?  addCategory,TResult Function( _DeleteCategory value)?  deleteCategory,TResult Function( _AddTodo value)?  addTodo,TResult Function( _UpdateTodo value)?  updateTodo,TResult Function( _DeleteTodo value)?  deleteTodo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SelectCategory() when selectCategory != null:
return selectCategory(_that);case _AddCategory() when addCategory != null:
return addCategory(_that);case _DeleteCategory() when deleteCategory != null:
return deleteCategory(_that);case _AddTodo() when addTodo != null:
return addTodo(_that);case _UpdateTodo() when updateTodo != null:
return updateTodo(_that);case _DeleteTodo() when deleteTodo != null:
return deleteTodo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SelectCategory value)  selectCategory,required TResult Function( _AddCategory value)  addCategory,required TResult Function( _DeleteCategory value)  deleteCategory,required TResult Function( _AddTodo value)  addTodo,required TResult Function( _UpdateTodo value)  updateTodo,required TResult Function( _DeleteTodo value)  deleteTodo,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SelectCategory():
return selectCategory(_that);case _AddCategory():
return addCategory(_that);case _DeleteCategory():
return deleteCategory(_that);case _AddTodo():
return addTodo(_that);case _UpdateTodo():
return updateTodo(_that);case _DeleteTodo():
return deleteTodo(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SelectCategory value)?  selectCategory,TResult? Function( _AddCategory value)?  addCategory,TResult? Function( _DeleteCategory value)?  deleteCategory,TResult? Function( _AddTodo value)?  addTodo,TResult? Function( _UpdateTodo value)?  updateTodo,TResult? Function( _DeleteTodo value)?  deleteTodo,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SelectCategory() when selectCategory != null:
return selectCategory(_that);case _AddCategory() when addCategory != null:
return addCategory(_that);case _DeleteCategory() when deleteCategory != null:
return deleteCategory(_that);case _AddTodo() when addTodo != null:
return addTodo(_that);case _UpdateTodo() when updateTodo != null:
return updateTodo(_that);case _DeleteTodo() when deleteTodo != null:
return deleteTodo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String categoryId)?  selectCategory,TResult Function( CategoryModel category)?  addCategory,TResult Function( String categoryId)?  deleteCategory,TResult Function( TodoModel todo)?  addTodo,TResult Function( TodoModel todo)?  updateTodo,TResult Function( String todoId)?  deleteTodo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SelectCategory() when selectCategory != null:
return selectCategory(_that.categoryId);case _AddCategory() when addCategory != null:
return addCategory(_that.category);case _DeleteCategory() when deleteCategory != null:
return deleteCategory(_that.categoryId);case _AddTodo() when addTodo != null:
return addTodo(_that.todo);case _UpdateTodo() when updateTodo != null:
return updateTodo(_that.todo);case _DeleteTodo() when deleteTodo != null:
return deleteTodo(_that.todoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String categoryId)  selectCategory,required TResult Function( CategoryModel category)  addCategory,required TResult Function( String categoryId)  deleteCategory,required TResult Function( TodoModel todo)  addTodo,required TResult Function( TodoModel todo)  updateTodo,required TResult Function( String todoId)  deleteTodo,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SelectCategory():
return selectCategory(_that.categoryId);case _AddCategory():
return addCategory(_that.category);case _DeleteCategory():
return deleteCategory(_that.categoryId);case _AddTodo():
return addTodo(_that.todo);case _UpdateTodo():
return updateTodo(_that.todo);case _DeleteTodo():
return deleteTodo(_that.todoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String categoryId)?  selectCategory,TResult? Function( CategoryModel category)?  addCategory,TResult? Function( String categoryId)?  deleteCategory,TResult? Function( TodoModel todo)?  addTodo,TResult? Function( TodoModel todo)?  updateTodo,TResult? Function( String todoId)?  deleteTodo,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SelectCategory() when selectCategory != null:
return selectCategory(_that.categoryId);case _AddCategory() when addCategory != null:
return addCategory(_that.category);case _DeleteCategory() when deleteCategory != null:
return deleteCategory(_that.categoryId);case _AddTodo() when addTodo != null:
return addTodo(_that.todo);case _UpdateTodo() when updateTodo != null:
return updateTodo(_that.todo);case _DeleteTodo() when deleteTodo != null:
return deleteTodo(_that.todoId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TodoEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoEvent.started()';
}


}




/// @nodoc


class _SelectCategory implements TodoEvent {
  const _SelectCategory(this.categoryId);
  

 final  String categoryId;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectCategoryCopyWith<_SelectCategory> get copyWith => __$SelectCategoryCopyWithImpl<_SelectCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'TodoEvent.selectCategory(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$SelectCategoryCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory _$SelectCategoryCopyWith(_SelectCategory value, $Res Function(_SelectCategory) _then) = __$SelectCategoryCopyWithImpl;
@useResult
$Res call({
 String categoryId
});




}
/// @nodoc
class __$SelectCategoryCopyWithImpl<$Res>
    implements _$SelectCategoryCopyWith<$Res> {
  __$SelectCategoryCopyWithImpl(this._self, this._then);

  final _SelectCategory _self;
  final $Res Function(_SelectCategory) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(_SelectCategory(
null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AddCategory implements TodoEvent {
  const _AddCategory(this.category);
  

 final  CategoryModel category;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCategoryCopyWith<_AddCategory> get copyWith => __$AddCategoryCopyWithImpl<_AddCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCategory&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'TodoEvent.addCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class _$AddCategoryCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory _$AddCategoryCopyWith(_AddCategory value, $Res Function(_AddCategory) _then) = __$AddCategoryCopyWithImpl;
@useResult
$Res call({
 CategoryModel category
});


$CategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$AddCategoryCopyWithImpl<$Res>
    implements _$AddCategoryCopyWith<$Res> {
  __$AddCategoryCopyWithImpl(this._self, this._then);

  final _AddCategory _self;
  final $Res Function(_AddCategory) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_AddCategory(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,
  ));
}

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _DeleteCategory implements TodoEvent {
  const _DeleteCategory(this.categoryId);
  

 final  String categoryId;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCategoryCopyWith<_DeleteCategory> get copyWith => __$DeleteCategoryCopyWithImpl<_DeleteCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'TodoEvent.deleteCategory(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$DeleteCategoryCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory _$DeleteCategoryCopyWith(_DeleteCategory value, $Res Function(_DeleteCategory) _then) = __$DeleteCategoryCopyWithImpl;
@useResult
$Res call({
 String categoryId
});




}
/// @nodoc
class __$DeleteCategoryCopyWithImpl<$Res>
    implements _$DeleteCategoryCopyWith<$Res> {
  __$DeleteCategoryCopyWithImpl(this._self, this._then);

  final _DeleteCategory _self;
  final $Res Function(_DeleteCategory) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(_DeleteCategory(
null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AddTodo implements TodoEvent {
  const _AddTodo(this.todo);
  

 final  TodoModel todo;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTodoCopyWith<_AddTodo> get copyWith => __$AddTodoCopyWithImpl<_AddTodo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTodo&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,todo);

@override
String toString() {
  return 'TodoEvent.addTodo(todo: $todo)';
}


}

/// @nodoc
abstract mixin class _$AddTodoCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory _$AddTodoCopyWith(_AddTodo value, $Res Function(_AddTodo) _then) = __$AddTodoCopyWithImpl;
@useResult
$Res call({
 TodoModel todo
});


$TodoModelCopyWith<$Res> get todo;

}
/// @nodoc
class __$AddTodoCopyWithImpl<$Res>
    implements _$AddTodoCopyWith<$Res> {
  __$AddTodoCopyWithImpl(this._self, this._then);

  final _AddTodo _self;
  final $Res Function(_AddTodo) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todo = null,}) {
  return _then(_AddTodo(
null == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as TodoModel,
  ));
}

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoModelCopyWith<$Res> get todo {
  
  return $TodoModelCopyWith<$Res>(_self.todo, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}

/// @nodoc


class _UpdateTodo implements TodoEvent {
  const _UpdateTodo(this.todo);
  

 final  TodoModel todo;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTodoCopyWith<_UpdateTodo> get copyWith => __$UpdateTodoCopyWithImpl<_UpdateTodo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTodo&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,todo);

@override
String toString() {
  return 'TodoEvent.updateTodo(todo: $todo)';
}


}

/// @nodoc
abstract mixin class _$UpdateTodoCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory _$UpdateTodoCopyWith(_UpdateTodo value, $Res Function(_UpdateTodo) _then) = __$UpdateTodoCopyWithImpl;
@useResult
$Res call({
 TodoModel todo
});


$TodoModelCopyWith<$Res> get todo;

}
/// @nodoc
class __$UpdateTodoCopyWithImpl<$Res>
    implements _$UpdateTodoCopyWith<$Res> {
  __$UpdateTodoCopyWithImpl(this._self, this._then);

  final _UpdateTodo _self;
  final $Res Function(_UpdateTodo) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todo = null,}) {
  return _then(_UpdateTodo(
null == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as TodoModel,
  ));
}

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoModelCopyWith<$Res> get todo {
  
  return $TodoModelCopyWith<$Res>(_self.todo, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}

/// @nodoc


class _DeleteTodo implements TodoEvent {
  const _DeleteTodo(this.todoId);
  

 final  String todoId;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTodoCopyWith<_DeleteTodo> get copyWith => __$DeleteTodoCopyWithImpl<_DeleteTodo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTodo&&(identical(other.todoId, todoId) || other.todoId == todoId));
}


@override
int get hashCode => Object.hash(runtimeType,todoId);

@override
String toString() {
  return 'TodoEvent.deleteTodo(todoId: $todoId)';
}


}

/// @nodoc
abstract mixin class _$DeleteTodoCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory _$DeleteTodoCopyWith(_DeleteTodo value, $Res Function(_DeleteTodo) _then) = __$DeleteTodoCopyWithImpl;
@useResult
$Res call({
 String todoId
});




}
/// @nodoc
class __$DeleteTodoCopyWithImpl<$Res>
    implements _$DeleteTodoCopyWith<$Res> {
  __$DeleteTodoCopyWithImpl(this._self, this._then);

  final _DeleteTodo _self;
  final $Res Function(_DeleteTodo) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todoId = null,}) {
  return _then(_DeleteTodo(
null == todoId ? _self.todoId : todoId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$TodoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoState()';
}


}

/// @nodoc
class $TodoStateCopyWith<$Res>  {
$TodoStateCopyWith(TodoState _, $Res Function(TodoState) __);
}


/// Adds pattern-matching-related methods to [TodoState].
extension TodoStatePatterns on TodoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CategoryModel> categories,  List<TodoModel> todos,  String selectedCategoryId)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.categories,_that.todos,_that.selectedCategoryId);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CategoryModel> categories,  List<TodoModel> todos,  String selectedCategoryId)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.categories,_that.todos,_that.selectedCategoryId);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CategoryModel> categories,  List<TodoModel> todos,  String selectedCategoryId)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.categories,_that.todos,_that.selectedCategoryId);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TodoState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoState.initial()';
}


}




/// @nodoc


class _Loading implements TodoState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoState.loading()';
}


}




/// @nodoc


class _Loaded implements TodoState {
  const _Loaded({required final  List<CategoryModel> categories, required final  List<TodoModel> todos, this.selectedCategoryId = 'all'}): _categories = categories,_todos = todos;
  

 final  List<CategoryModel> _categories;
 List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<TodoModel> _todos;
 List<TodoModel> get todos {
  if (_todos is EqualUnmodifiableListView) return _todos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todos);
}

@JsonKey() final  String selectedCategoryId;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._todos, _todos)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_todos),selectedCategoryId);

@override
String toString() {
  return 'TodoState.loaded(categories: $categories, todos: $todos, selectedCategoryId: $selectedCategoryId)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<CategoryModel> categories, List<TodoModel> todos, String selectedCategoryId
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? todos = null,Object? selectedCategoryId = null,}) {
  return _then(_Loaded(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,todos: null == todos ? _self._todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoModel>,selectedCategoryId: null == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements TodoState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TodoState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
