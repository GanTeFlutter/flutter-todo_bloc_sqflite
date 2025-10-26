import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/future/splash/state/splash_cubit.dart';
import 'package:flutter_todo_app/product/enum/drawer_enum.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

final class SplashView extends StatelessWidget {
  const SplashView({super.key});
  void _handleNavigation(BuildContext context, SplashState state) {
    if (state is! SplashLoaded) return;

    final route = state.version
        ? AppViews.drawerHome.name
        : AppViews.updateVersionView.name;
    context.goNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: _handleNavigation,
      child: Scaffold(
        body: Center(
          child: Assets.lottie.premiumAnimation.lottie(package: 'gen'),
        ),
      ),
    );
  }
}
