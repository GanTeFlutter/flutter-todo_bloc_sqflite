import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/future/todos/mixin/todo_view_mixin.dart';
import 'package:flutter_todo_app/future/todos/state/bloc/todo_bloc.dart';
import 'package:flutter_todo_app/product/constant/project_padding.dart';
import 'package:flutter_todo_app/product/constant/project_radius.dart';
import 'package:flutter_todo_app/product/constant/project_string.dart';
import 'package:flutter_todo_app/product/widget/todo/todo_category_smbh.dart';
import 'package:flutter_todo_app/product/widget/todo/todo_smbh.dart';
import 'package:kartal/kartal.dart';

part 'widget/bloc_companent.dart';
part 'widget/category_button.dart';
part 'widget/screen_header.dart';

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> with TodoViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: ProjectPadding.allSmall,
          child: ListView(
            children: [
              _TodoViewHeaders(
                data: AppString.categories,
                icon: Icons.add,
                onPressed: () => CategoryModalBottomSheet.show(context),
              ),
              const _CategorySection(),
              _TodoViewHeaders(
                data: AppString.notes,
                icon: Icons.add,
                onPressed: () => AddTodoBottomSheet.show(context),
              ),
              const _TodoListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
