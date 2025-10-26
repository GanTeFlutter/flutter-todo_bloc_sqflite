import 'package:flutter/material.dart';
import 'package:flutter_todo_app/future/drawer_home/drawer_home.dart';
import 'package:flutter_todo_app/future/todos/todo_view.dart';
import 'package:flutter_todo_app/product/widget/todo/todo_category_smbh.dart';
import 'package:flutter_todo_app/product/widget/todo/todo_smbh.dart';

@immutable
class AppString {
  const AppString._();

  /// [DrawerHome]
  static const String todos = 'Notlar';
  static const String profile = 'Profil';

  /// [TodosView]
  static const String categories = 'Kategoriler';
  static const String notes = 'Notlar';
  static const String allNotes = 'Tüm Notlar';
  static const String noNotesYet = 'Henüz not yok';
  static const String noCategoriesYet = 'Henüz kategori yok. Kategori ekleyin.';

  /// [CategoryModalBottomSheet]
  static const String addNewCategory = 'Yeni Kategori Ekle';
  static const String categoryName = 'Kategori Adı';
  static const String addCategoryHint = 'Örn: İş, Kişisel, Alışveriş';
  static const String addCategory = 'Kategori Ekle';
  static const String adding = 'Ekleniyor...';
  // Validation Messages
  static const String categoryNameRequired = 'Kategori adı boş bırakılamaz';
  static const String categoryNameMinLength =
      'Kategori adı en az 2 karakter olmalıdır';
  static const String categoryNameMaxLength =
      'Kategori adı en fazla 30 karakter olabilir';
  // Success & Error Messages
  static const String categoryAddedSuccessfully = 'Kategori başarıyla eklendi';
  static const String categoryAddError =
      'Bir hata oluştu. Lütfen tekrar deneyin.';

  /// [AddTodoBottomSheet]
  static const String addNewTodo = 'Yeni Görev Ekle';
  static const String todoTitle = 'Başlık';
  static const String todoDescription = 'Açıklama';
  static const String todoTitleHint = 'Görevi kısaca özetleyin';
  static const String todoDescHint = 'Detaylı açıklama yazın';
  static const String reminder = 'Hatırlatıcı';
  static const String category = 'Kategori';
  static const String selectCategory = 'Kategori Seçin';
  static const String addTodo = 'Görevi Ekle';
  static const String noCategoryAvailable = 'Kategori yok';

  // Validation Messages
  static const String todoTitleRequired = 'Başlık boş olamaz';
  static const String todoTitleMinLength = 'Başlık en az 3 karakter olmalıdır';
  static const String todoTitleMaxLength =
      'Başlık en fazla 50 karakter olabilir';
  static const String todoDescRequired = 'Açıklama boş olamaz';
  static const String todoDescMinLength = 'Açıklama en az 5 karakter olmalıdır';
  static const String todoCategoryRequired = 'Bir kategori seçmelisiniz';

  // Success & Error Messages
  static const String todoAddedSuccessfully = 'Görev başarıyla eklendi';
  static const String todoAddError = 'Görev eklenirken bir hata oluştu';
}
