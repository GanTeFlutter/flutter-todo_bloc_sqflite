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

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: ProjectRadius.bottomSheet,
      ),
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const AddTodoBottomSheet(),
      ),
    );
  }

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;
  late final CategoryIdService _categoryIdService;

  bool _isLoading = false;
  bool _hasReminder = false;
  final int _priority = 1;
  CategoryModel? _selectedCategory;

  String? _titleError;
  String? _descError;
  String? _categoryError;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _categoryIdService = locator<CategoryIdService>();

    _titleController.addListener(_onTitleChanged);
    _descController.addListener(_onDescChanged);
  }

  @override
  void dispose() {
    _titleController
      ..removeListener(_onTitleChanged)
      ..dispose();
    _descController
      ..removeListener(_onDescChanged)
      ..dispose();
    super.dispose();
  }

  void _onTitleChanged() {
    if (_titleError != null && _titleController.text.isNotEmpty) {
      setState(() => _titleError = null);
    }
  }

  void _onDescChanged() {
    if (_descError != null && _descController.text.isNotEmpty) {
      setState(() => _descError = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.allMedium,
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                const Center(
                  child: Text(
                    AppString.addNewTodo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                _buildTextField(
                  controller: _titleController,
                  label: AppString.todoTitle,
                  hint: AppString.todoTitleHint,
                  icon: Icons.title,
                  errorText: _titleError,
                ),

                _buildTextField(
                  controller: _descController,
                  label: AppString.todoDescription,
                  hint: AppString.todoDescHint,
                  icon: Icons.description,
                  errorText: _descError,
                  maxLines: 3,
                ),

                _buildCategorySelector(state),

                _buildReminderSwitch(),

                _saveCategory(),
              ],
            ),
          );
        },
      ),
    );
  }

  //Aşşası biraz karşık oldu ama düzelteceğizz elbett...

  SizedBox _saveCategory() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: _isLoading ? null : _handleAddTodo,
        icon: _isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.add),
        label: Text(
          _isLoading ? AppString.adding : AppString.addTodo,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    String? errorText,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      enabled: !_isLoading,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        errorText: errorText,
        errorMaxLines: 2,
        border: const OutlineInputBorder(
          borderRadius: ProjectRadius.allSmall,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: ProjectRadius.allSmall,
          borderSide: BorderSide(
            color: errorText != null
                ? Theme.of(context).colorScheme.error
                : Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: ProjectRadius.allSmall,
          borderSide: BorderSide(
            color: errorText != null
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
    );
  }

  Widget _buildCategorySelector(TodoState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.category, size: 20),
            SizedBox(width: 8),
            Text(
              AppString.category,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: ProjectPadding.horizontalSmall,
          decoration: BoxDecoration(
            border: Border.all(
              color: _categoryError != null
                  ? Theme.of(context).colorScheme.error
                  : Colors.grey.shade300,
            ),
            borderRadius: ProjectRadius.allSmall,
          ),
          child: state.when(
            initial: () => const Center(
              child: Padding(
                padding: ProjectPadding.verticalSmall,
                child: Text(AppString.noCategoryAvailable),
              ),
            ),
            loading: () => const Center(
              child: Padding(
                padding: ProjectPadding.verticalSmall,
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
            loaded: (categories, _, _) {
              if (categories.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: ProjectPadding.verticalSmall,
                    child: Text(AppString.noCategoryAvailable),
                  ),
                );
              }

              return DropdownButton<CategoryModel>(
                value: _selectedCategory,
                hint: const Text(AppString.selectCategory),
                isExpanded: true,
                underline: const SizedBox.shrink(),
                items: categories.map((cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Color(cat.colorCode),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            cat.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: _isLoading
                    ? null
                    : (val) {
                        setState(() {
                          _selectedCategory = val;
                          _categoryError = null;
                        });
                        if (val != null) {
                          locator.logger.i('Kategori seçildi: ${val.name}');
                        }
                      },
              );
            },
            error: (msg) => Center(
              child: Padding(
                padding: ProjectPadding.verticalSmall,
                child: Text(
                  'Hata: $msg',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (_categoryError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12),
            child: Text(
              _categoryError!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildReminderSwitch() {
    return Row(
      children: [
        const Icon(Icons.notifications, size: 20),
        const SizedBox(width: 8),
        const Text(
          AppString.reminder,
          style: TextStyle(fontSize: 16),
        ),
        const Spacer(),
        Switch(
          value: _hasReminder,
          onChanged: _isLoading
              ? null
              : (val) => setState(() => _hasReminder = val),
        ),
      ],
    );
  }

  Future<void> _handleAddTodo() async {
    if (!_validateInputs()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _titleError = null;
      _descError = null;
      _categoryError = null;
    });

    try {
      final todoId = await _categoryIdService.generateTodoId();

      final newTodo = TodoModel(
        id: todoId,
        title: _titleController.text.trim(),
        description: _descController.text.trim(),
        isCompleted: 0,
        priority: _priority,
        categoryId: _selectedCategory!.id,
        hasReminder: _hasReminder ? 1 : 0,
        createdAt: DateTime.now(),
      );

      if (!mounted) return;

      context.read<TodoBloc>().add(
        TodoEvent.addTodo(newTodo),
      );

      if (mounted) {
        context.showSnackBar(AppString.todoAddedSuccessfully);
        Navigator.of(context).pop();
      }
    } on Exception catch (e) {
      locator.logger.e('Görev eklenirken hata oluştu: $e');

      if (mounted) {
        setState(() {
          _descError = AppString.todoAddError;
        });
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  bool _validateInputs() {
    final title = _titleController.text.trim();
    final desc = _descController.text.trim();
    var isValid = true;

    if (title.isEmpty) {
      setState(() => _titleError = AppString.todoTitleRequired);
      isValid = false;
    } else if (title.length < 3) {
      setState(() => _titleError = AppString.todoTitleMinLength);
      isValid = false;
    } else if (title.length > 50) {
      setState(() => _titleError = AppString.todoTitleMaxLength);
      isValid = false;
    }

    if (desc.isEmpty) {
      setState(() => _descError = AppString.todoDescRequired);
      isValid = false;
    } else if (desc.length < 5) {
      setState(() => _descError = AppString.todoDescMinLength);
      isValid = false;
    }

    if (_selectedCategory == null) {
      setState(() => _categoryError = AppString.todoCategoryRequired);
      isValid = false;
    }

    return isValid;
  }
}
