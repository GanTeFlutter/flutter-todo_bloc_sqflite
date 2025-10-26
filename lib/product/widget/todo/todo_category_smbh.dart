import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/future/todos/state/bloc/todo_bloc.dart';
import 'package:flutter_todo_app/product/constant/project_padding.dart';
import 'package:flutter_todo_app/product/constant/project_radius.dart';
import 'package:flutter_todo_app/product/constant/project_string.dart';
import 'package:flutter_todo_app/product/extension/show_snackbar.dart';
import 'package:flutter_todo_app/product/service/service_locator.dart';
import 'package:flutter_todo_app/product/service/services/app_micro_services/categoriy_id_services.dart';
import 'package:gen/gen.dart';

class CategoryModalBottomSheet extends StatefulWidget {
  const CategoryModalBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: ProjectRadius.allMedium,
      ),
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const CategoryModalBottomSheet(),
      ),
    );
  }

  @override
  State<CategoryModalBottomSheet> createState() =>
      _CategoryModalBottomSheetState();
}

class _CategoryModalBottomSheetState extends State<CategoryModalBottomSheet> {
  late final TextEditingController _textController;
  late final CategoryIdService _categoryIdService;

  bool _isLoading = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _categoryIdService = locator<CategoryIdService>();
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController
      ..removeListener(_onTextChanged)
      ..dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (_errorText != null && _textController.text.isNotEmpty) {
      setState(() => _errorText = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.allMedium,
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            AppString.addNewCategory,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: AppString.categoryName,
              hintText: AppString.addCategoryHint,
              prefixIcon: const Icon(Icons.category),
              errorText: _errorText,
              errorMaxLines: 2,
              border: const OutlineInputBorder(
                borderRadius: ProjectRadius.allSmall,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: ProjectRadius.allSmall,
                borderSide: BorderSide(
                  color: _errorText != null
                      ? Theme.of(context).colorScheme.error
                      : Colors.grey.shade300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: ProjectRadius.allSmall,
                borderSide: BorderSide(
                  color: _errorText != null
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: ProjectRadius.allSmall,
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: ProjectRadius.allSmall,
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 2,
                ),
              ),
            ),
            textInputAction: TextInputAction.done,
            enabled: !_isLoading,
            autofocus: true,
            onSubmitted: (_) => _addCategory(),
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _isLoading ? null : _addCategory,
              icon: _isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.add),
              label: Text(
                _isLoading ? AppString.adding : AppString.addCategory,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addCategory() async {
    if (!_validateInput()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    try {
      final categoryId = await _categoryIdService.generateCategoryId();
      final colorCode = _categoryIdService.generatePastelColor();

      final categoryModel = CategoryModel(
        id: categoryId,
        name: _textController.text.trim(),
        colorCode: colorCode,
      );

      if (!mounted) return;

      context.read<TodoBloc>().add(
        TodoEvent.addCategory(categoryModel),
      );

      if (mounted) {
        context.showSnackBar(AppString.categoryAddedSuccessfully);
        Navigator.of(context).pop();
      }
    } on Exception catch (e) {
      locator.logger.e('Kategori eklenirken hata oluştu: $e');

      if (mounted) {
        setState(() {
          _errorText = AppString.categoryAddError;
        });
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  bool _validateInput() {
    final text = _textController.text.trim();

    if (text.isEmpty) {
      setState(() => _errorText = AppString.categoryNameRequired);
      return false;
    }

    if (text.length < 2) {
      setState(() => _errorText = AppString.categoryNameMinLength);
      return false;
    }

    if (text.length > 15) {
      setState(() => _errorText = AppString.categoryNameMaxLength);
      return false;
    }
    return true;
  }
}
