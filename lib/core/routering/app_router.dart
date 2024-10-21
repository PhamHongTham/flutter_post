import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post/data/model/home_model/home_model.dart';
import 'package:post/presentation/contact_screen/contact_screen.dart';
import 'package:post/presentation/favorite_screen/favorite_screen.dart';
import 'package:post/presentation/home_screen/home_detail.dart';
import 'package:post/presentation/home_screen/home_screen.dart';
import '../../presentation/main_screen/scaffold_with_nested_navigation.dart';
import '../../presentation/onboarding_screen/onboarding_bloc.dart';
import '../../presentation/onboarding_screen/onboarding_screen.dart';
import '../../presentation/splash_screen/splash_screen.dart';
import 'router_path.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');

class AppRouter {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Routers.splash,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routers.splash,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: Routers.detail,
        builder: (context, state) {
          final post = state.extra as HomeModel; // Truyền bài viết qua extra
          return HomeDetail(post: post);
        },
      ),
      GoRoute(
        path: Routers.onboarding,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            restorationId: state.pageKey.value,
            child: BlocProvider(
              create: (context) => OnboardingBloc(),
              child: const OnboardingScreen(),
            ),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        //(context, state, navShell) => Scaffold(body: navShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: [
              GoRoute(
                path: Routers.home,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      key: state.pageKey,
                      restorationId: state.pageKey.value,
                      child: const HomeScreen());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              GoRoute(
                path: Routers.contact,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      key: state.pageKey,
                      restorationId: state.pageKey.value,
                      child: const ContactScreen());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCKey,
            routes: [
              GoRoute(
                path: Routers.favorite,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      key: state.pageKey,
                      restorationId: state.pageKey.value,
                      child: const FavoriteScreen());
                },
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      return null;
    },
  );
}
