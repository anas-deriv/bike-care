import 'package:bikecare/src/config/presentation/cubits/cubit/routing_cubit.dart';
import 'package:bikecare/src/config/presentation/utils/constants/keys/bottom_navigation_bar_route_keys.dart';
import 'package:bikecare/src/config/presentation/utils/constants/strings.dart';
import 'package:bikecare/src/config/presentation/views/bottom_navigation_bar_place_holder.dart';
import 'package:bikecare/src/config/presentation/views/dashboard_page.dart';
import 'package:bikecare/src/config/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bottom_navigation_bar_place_holder_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RoutingCubit>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late RoutingCubit routingCubit;

  setUpAll(() {
    routingCubit = MockRoutingCubit();
    when(routingCubit.state).thenReturn(RoutingLoadedState(bottomNavPath: PAGES.dashboard.screenPath, bottomNavBarIndex: 0));
  });

  Widget bottomNavigationBarPlaceHolderWidget(Widget screen) => BlocProvider(
        create: (_) => routingCubit,
        child: MaterialApp(
          home: Scaffold(
            body: BottomNavigationBarPlaceHolder(screen: screen),
          ),
        ),
      );

  testWidgets(
    'Should show label and widgets',
    (widgetTester) async {
      await widgetTester.pumpWidget(
          bottomNavigationBarPlaceHolderWidget(const DashboardPage()));
      await widgetTester.pumpAndSettle();

      expect(find.byKey(dashboardBottomNavBarKey), findsOneWidget);
      expect(find.byKey(notificationBottomNavBarKey), findsOneWidget);
      expect(find.byKey(planningBottomNavBarKey), findsOneWidget);
      expect(find.byKey(profileBottomNavBarKey), findsOneWidget);
      expect(find.text(bottomNavigationBarItemsLabel[0]), findsOneWidget);
      expect(find.text(bottomNavigationBarItemsLabel[1]), findsOneWidget);
      expect(find.text(bottomNavigationBarItemsLabel[2]), findsOneWidget);
      expect(find.text(bottomNavigationBarItemsLabel[3]), findsOneWidget);
    },
  );
}
