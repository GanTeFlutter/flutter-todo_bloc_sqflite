import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/future/drawer_home/cubit/drawer_cubit.dart';
import 'package:flutter_todo_app/future/todos/todo_view.dart';
import 'package:flutter_todo_app/product/constant/project_string.dart';
import 'package:gen/gen.dart';
part 'widget/custom_drawer.dart';
part 'widget/drawer_custom_appbar.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({super.key});

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const _CustomDrawer(),
      appBar: const _CustomAppbar(),
      body: BlocBuilder<DrawerCubit, DrawerPageSelected>(
        builder: (context, state) {
          final index = state.index;
          switch (index) {
            case 0:
              return const TodosView();
            case 1:
              return const TodoAppTest();
            case 2:
              return const TodoAppTest();
            case 3:
              return const TodoAppTest();
            default:
              return const TodoAppTest();
          }
        },
      ),
    );
  }
}

class TodoAppTest extends StatelessWidget {
  const TodoAppTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
