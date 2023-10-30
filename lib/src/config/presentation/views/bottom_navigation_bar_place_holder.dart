import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:bikecare/src/config/presentation/utils/constants/keys/bottom_navigation_bar_route_keys.dart';
import 'package:bikecare/src/config/presentation/utils/constants/strings.dart';
import 'package:bikecare/src/config/presentation/cubits/cubit/routing_cubit.dart';
import 'package:bikecare/src/config/presentation/widgets/bottom_navigation_bar_route.dart';
import 'package:bikecare/src/config/router/router_utils.dart';

/// This [BottomNavigationBarPlaceHolder] holding the routing
/// bottom navigation bar with cubit implemented
class BottomNavigationBarPlaceHolder extends StatefulWidget {
  /// [screen] is a Widget that has been passed from routing
  /// and built in [ShellRoute] with bottom navigation bar
  final Widget screen;

  const BottomNavigationBarPlaceHolder({
    super.key,
    required this.screen,
  });

  @override
  State<BottomNavigationBarPlaceHolder> createState() =>
      _BottomNavigationBarPlaceHolderState();
}

class _BottomNavigationBarPlaceHolderState
    extends State<BottomNavigationBarPlaceHolder> {
  final bottomNavigationItems = [
    BottomNavigationBarRoute(
      initialLocation: PAGES.dashboard.screenPath,
      icon: const Icon(
        Icons.dashboard_sharp,
        key: dashboardBottomNavBarKey,
      ),
      label: bottomNavigationBarItemsLabel[0],
    ),
    BottomNavigationBarRoute(
      initialLocation: PAGES.notification.screenPath,
      icon: const Icon(
        Icons.notifications,
        key: notificationBottomNavBarKey,
      ),
      label: bottomNavigationBarItemsLabel[1],
    ),
    BottomNavigationBarRoute(
      initialLocation: PAGES.planning.screenPath,
      icon: const Icon(
        Icons.edit_calendar,
        key: planningBottomNavBarKey,
      ),
      label: bottomNavigationBarItemsLabel[2],
    ),
    BottomNavigationBarRoute(
      initialLocation: PAGES.profile.screenPath,
      icon: const Icon(
        Icons.manage_accounts,
        key: profileBottomNavBarKey,
      ),
      label: bottomNavigationBarItemsLabel[3],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screen,
      bottomNavigationBar: _buildBottomNavigation(
        context,
        bottomNavigationItems,
      ),
    );
  }

  // TODO: refactor this code and make it dynamic
  BlocBuilder<RoutingCubit, RoutingState> _buildBottomNavigation(
          mContext, List<BottomNavigationBarRoute> bottomNavigationItems) =>
      BlocBuilder<RoutingCubit, RoutingState>(
        buildWhen: (previous, current) =>
            previous.bottomNavBarIndex != current.bottomNavBarIndex,
        builder: (context, state) {
          return _buildBottomNavigationBar(
              state, context, bottomNavigationItems, mContext);
        },
      );

  Widget _buildBottomNavigationBar(RoutingState state, BuildContext context,
      List<BottomNavigationBarRoute> bottomNavigationItems, mContext) {
    return BottomNavigationBar(
      onTap: (value) async {
        if (state.bottomNavBarIndex != value) {
          context.read<RoutingCubit>().selectedNavigationBarItems(value);
          context.go(bottomNavigationItems[value].initialLocation);
        }
      },
      showSelectedLabels: true,
      showUnselectedLabels: true,
      fixedColor: Colors.white,
      elevation: 0,
      backgroundColor: Colors.blue,
      unselectedItemColor: Colors.blueAccent[100],
      selectedIconTheme: IconThemeData(
        color: Colors.white,
        size: ((IconTheme.of(mContext).size)! * 1.3),
      ),
      items: bottomNavigationItems,
      currentIndex: state.bottomNavBarIndex,
      type: BottomNavigationBarType.fixed,
    );
  }
}
