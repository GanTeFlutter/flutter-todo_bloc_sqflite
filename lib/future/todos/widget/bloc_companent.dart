part of '../todo_view.dart';

class _CategorySection extends StatelessWidget {
  const _CategorySection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (categories, _, selectedCategoryId) {
            if (categories.isEmpty) {
              return const Card(
                child: Padding(
                  padding: ProjectPadding.allMedium,
                  child: Text(
                    AppString.noCategoriesYet,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                // Tümünü göster butonu
                _CategoryButton(
                  label: 'Tümü',
                  isSelected: selectedCategoryId == 'all',
                  onPressed: () {
                    context.read<TodoBloc>().add(
                      const TodoEvent.selectCategory('all'),
                    );
                  },
                  color: Colors.blueGrey,
                ),
                ...categories.map(
                  (category) => _CategoryButton(
                    label: category.name,
                    isSelected: selectedCategoryId == category.id,
                    onPressed: () {
                      context.read<TodoBloc>().add(
                        TodoEvent.selectCategory(category.id),
                      );
                    },
                    color: Color(category.colorCode),
                  ),
                ),
              ],
            );
          },
          error: (msg) => Text('Hata: $msg'),
        );
      },
    );
  }
}

class _TodoListSection extends StatelessWidget {
  const _TodoListSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (_, todos, selectedCategoryId) {
            if (todos.isEmpty) {
              return Card(
                child: Padding(
                  padding: ProjectPadding.allMedium,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.task_alt,
                      ),
                      SizedBox(height: context.sized.lowValue),
                      Text(
                        selectedCategoryId == 'all'
                            ? AppString.noNotesYet
                            : AppString.noNotesYet,
                        textAlign: TextAlign.center,
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('Yeni Görev Ekle'),
                        onPressed: () {
                          AddTodoBottomSheet.show(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }

            return Column(
              children: todos.map((todo) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Checkbox(
                      value: todo.isCompleted == 1,
                      onChanged: (val) {
                        final updatedTodo = todo.copyWith(
                          isCompleted: val! ? 1 : 0,
                        );
                        context.read<TodoBloc>().add(
                          TodoEvent.updateTodo(updatedTodo),
                        );
                      },
                    ),
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isCompleted == 1
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    subtitle: Text(todo.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (todo.hasReminder == 1)
                          const Icon(
                            Icons.notifications_active,
                            size: 16,
                            color: Colors.orange,
                          ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context.read<TodoBloc>().add(
                              TodoEvent.deleteTodo(todo.id),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
          error: (msg) => Text('Hata: $msg'),
        );
      },
    );
  }
}
