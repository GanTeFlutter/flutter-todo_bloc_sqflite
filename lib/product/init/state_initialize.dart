import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/future/drawer_home/cubit/drawer_cubit.dart';
import 'package:flutter_todo_app/future/splash/state/splash_cubit.dart';
import 'package:flutter_todo_app/future/todos/state/bloc/todo_bloc.dart';
import 'package:flutter_todo_app/future/todos/state/bloc_helper_service.dart';

import 'package:flutter_todo_app/product/service/service_locator.dart';
import 'package:flutter_todo_app/product/service/services/sqflite/sqflite_service.dart';

import 'package:flutter_todo_app/product/service/services/version/version_maneger_service.dart';

///[StateInitialize] is a widget that initializes the state management
///[StateInitialize] bloc ve providerlarımızı burada başlatıyoruz
class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit(locator<VersionManagerService>()),
        ),
        BlocProvider(
          create: (context) => DrawerCubit(),
        ),

        BlocProvider(
          create: (context) => TodoBloc(
            locator<SqfliteService>(),
            BlocHelperService(),
          ),
        ),
      ],
      child: child,
    );
  }
}
