import 'package:bikecare/src/config/router/router_application.dart';
import 'package:bikecare/src/config/router/router_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routing_state.dart';

class RoutingCubit extends Cubit<RoutingState> {
  RoutingCubit() : super(const RoutingInitialState());

  /// Emitting the state and value to the cubit
  void selectedNavigationBarItems(int index) {
    switch (index) {
      case 0:
        emit(
          RoutingLoadedState(
            bottomNavPath: PAGES.dashboard.screenPath,
            bottomNavBarIndex: index,
          ),
        );
        break;
      case 1:
        emit(
          RoutingLoadedState(
            bottomNavPath: PAGES.notification.screenPath,
            bottomNavBarIndex: index,
          ),
        );
        break;
      case 2:
        emit(
          RoutingLoadedState(
            bottomNavPath: PAGES.planning.screenPath,
            bottomNavBarIndex: index,
          ),
        );
        break;
      case 3:
        emit(
          RoutingLoadedState(
            bottomNavPath: PAGES.profile.screenPath,
            bottomNavBarIndex: index,
          ),
        );
        break;
    }
  }

  /// go will replace the whole route
  void goToPage(String path) {
    AppRouter.router.go(path);
  }

  /// push will continue the route
  void pushToPage(String path) {
    AppRouter.router.push(path);
  }
}
