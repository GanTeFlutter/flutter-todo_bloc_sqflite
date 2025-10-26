import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/product/service/service_locator.dart';
import 'package:flutter_todo_app/product/service/services/shared_preferences/shared_preferences_service.dart';

/// Kategori ve Todo ID yönetimi ile renk üretimi için servis
class CategoryIdService {
  CategoryIdService(this._sharedPreferencesService);

  final SharedPreferencesService _sharedPreferencesService;
  final _random = Random();

  static const String _categoryIdKey = 'category_id';
  static const String _todoIdKey = 'todo_id';

  /// Otomatik artan kategori ID'si üretir (0, 1, 2, 3...)
  Future<String> generateCategoryId() async {
    final currentId = _sharedPreferencesService.getString(_categoryIdKey);

    int newId;
    if (currentId == null) {
      newId = 0;
      locator.logger.i('İlk kategori ID oluşturuluyor: $newId');
    } else {
      newId = int.parse(currentId) + 1;
    }

    await _sharedPreferencesService.setString(_categoryIdKey, newId.toString());
    locator.logger.i('Yeni kategori ID oluşturuldu: $newId');

    return newId.toString();
  }

  /// Otomatik artan todo ID'si üretir (0, 1, 2, 3...)
  Future<String> generateTodoId() async {
    final currentId = _sharedPreferencesService.getString(_todoIdKey);

    int newId;
    if (currentId == null) {
      newId = 0;
      locator.logger.i('İlk todo ID oluşturuluyor: $newId');
    } else {
      newId = int.parse(currentId) + 1;
    }

    await _sharedPreferencesService.setString(_todoIdKey, newId.toString());
    locator.logger.i('Yeni todo ID oluşturuldu: $newId');

    return newId.toString();
  }

  /// Flutter'ın primaries paletinden rastgele bir renk kodu döndürür
  int generateRandomColorCode() {
    final randomIndex = _random.nextInt(Colors.primaries.length);
    final color = Colors.primaries[randomIndex];
    locator.logger.d('Random renk üretildi: ${color.toARGB32()}');
    return color.toARGB32();
  }

  /// Pastel (yumuşak) bir renk kodu döndürür
  int generatePastelColor() {
    final colors = [
      Colors.red.shade300,
      Colors.pink.shade300,
      Colors.purple.shade300,
      Colors.deepPurple.shade300,
      Colors.indigo.shade300,
      Colors.blue.shade300,
      Colors.lightBlue.shade300,
      Colors.cyan.shade300,
      Colors.teal.shade300,
      Colors.green.shade300,
      Colors.lightGreen.shade300,
      Colors.lime.shade300,
      Colors.yellow.shade300,
      Colors.amber.shade300,
      Colors.orange.shade300,
      Colors.deepOrange.shade300,
    ];
    final color = colors[_random.nextInt(colors.length)];
    locator.logger.d('Pastel renk üretildi: ${color.toARGB32()}');
    return color.toARGB32();
  }

  /// Canlı (koyu ve belirgin) bir renk kodu döndürür
  int generateVibrantColor() {
    final colors = [
      Colors.red.shade700,
      Colors.pink.shade700,
      Colors.purple.shade700,
      Colors.deepPurple.shade700,
      Colors.indigo.shade700,
      Colors.blue.shade700,
      Colors.teal.shade700,
      Colors.green.shade700,
      Colors.orange.shade700,
      Colors.deepOrange.shade700,
    ];
    final color = colors[_random.nextInt(colors.length)];
    locator.logger.d('Canlı renk üretildi: ${color.toARGB32()}');
    return color.toARGB32();
  }

  /// Kullanıcının daha önce kullanmadığı bir renk döndürür (opsiyonel)
  int generateUniqueColor(List<int> usedColors) {
    final allColors = Colors.primaries.map((c) => c.toARGB32()).toList();
    final availableColors = allColors
        .where((c) => !usedColors.contains(c))
        .toList();

    if (availableColors.isEmpty) {
      // Tüm renkler kullanılmışsa, rastgele bir renk döndür
      return generateRandomColorCode();
    }

    final color = availableColors[_random.nextInt(availableColors.length)];
    locator.logger.d('Benzersiz renk üretildi: $color');
    return color;
  }

  // ============================================
  // GETTERS
  // ============================================

  /// Son kullanılan todo ID'sini getirir
  String? get currentTodoId => _sharedPreferencesService.getString(_todoIdKey);

  /// Son kullanılan kategori ID'sini getirir
  String? get currentCategoryId =>
      _sharedPreferencesService.getString(_categoryIdKey);
}
