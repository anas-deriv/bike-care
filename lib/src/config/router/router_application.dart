import 'package:bikecare/src/config/presentation/views/dashboard_page.dart';
import 'package:bikecare/src/config/presentation/views/notification_page.dart';
import 'package:bikecare/src/config/presentation/views/planning_page.dart';
import 'package:bikecare/src/config/presentation/views/profile_setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:bikecare/src/config/presentation/cubits/cubit/routing_cubit.dart';
import 'package:bikecare/src/config/presentation/views/bottom_navigation_bar_place_holder.dart';
import 'package:bikecare/src/config/router/router_utils.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: PAGES.dashboard.screenPath,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    errorBuilder: (context, state) {
      // TODO: make a specific error page
      return const Scaffold(
        body: Center(
          child: Text("Error Not Found"),
        ),
      );
    },
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => RoutingCubit(),
            child: BottomNavigationBarPlaceHolder(screen: child),
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            name: PAGES.dashboard.screenName,
            path: PAGES.dashboard.screenPath,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: DashboardPage());
            },
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            name: PAGES.notification.screenName,
            path: PAGES.notification.screenPath,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: NotificationPage());
            },
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            name: PAGES.planning.screenName,
            path: PAGES.planning.screenPath,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: PlanningPage());
            },
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            name: PAGES.profile.screenName,
            path: PAGES.profile.screenPath,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: ProfileSettingPage());
            },
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/',
        builder: (builder, context) {
          return const CircularProgressIndicator.adaptive();
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
