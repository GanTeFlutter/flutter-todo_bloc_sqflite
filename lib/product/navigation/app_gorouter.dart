part of '../../main.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
      //splash icinde !
      routes: <RouteBase>[
        GoRoute(
          path: '/UpdateVersionView',
          name: 'UpdateVersionView',
          builder: (BuildContext context, GoRouterState state) {
            return const UpdateVersionView();
          },
        ),
      ],
    ),
    //yeni rota
    GoRoute(
      path: '/${AppViews.drawerHome.name}',
      name: AppViews.drawerHome.name,
      builder: (BuildContext context, GoRouterState state) {
        return const DrawerHome();
      },
    ),
  ],
);
