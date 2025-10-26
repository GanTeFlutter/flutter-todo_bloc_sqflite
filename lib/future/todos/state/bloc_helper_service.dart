import 'package:flutter_todo_app/product/service/service_locator.dart';

class BlocHelperService {
  final String _cacheSelectedCategoryKey = 'selected_category';

  void cacheSelectedCategory(String categoryId) {
    locator.sharedprefs.setString(_cacheSelectedCategoryKey, categoryId);
    locator.logger.i('cacheSelectedCategory: $categoryId');
  }

  String? getCachedSelectedCategory() {
    final categoryId = locator.sharedprefs.getString(_cacheSelectedCategoryKey);
    locator.logger.i('getCachedSelectedCategory: $categoryId');
    return categoryId;
  }
}
