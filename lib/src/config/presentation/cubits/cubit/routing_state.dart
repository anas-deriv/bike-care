part of 'routing_cubit.dart';

/// Routing state base class
abstract class RoutingState extends Equatable {
  /// a page's address or path for each index of [bottomNavBarIndex]
  final String bottomNavPath;

  /// Indexes of the icon selected by user
  final int bottomNavBarIndex;

  /// Constructs the Routing State
  const RoutingState({
    required this.bottomNavPath,
    required this.bottomNavBarIndex,
  });

  /// This getter overrides the [props] getter from the [Equatable] class to ensure
  /// that two [RoutingState] objects will always be considered equal, regardless
  /// of the values of their individual fields. This is because the [RoutingState]
  /// object is used to represent the current state of the routing system, and the
  /// routing system should not be compared for equality.
  @override
  List<Object?> get props => <Object>[bottomNavPath, bottomNavBarIndex];
}

/// This is the initial state of your application,
/// representing the default route or screen when
/// the app starts.
class RoutingInitialState extends RoutingState {
  /// Starter state for routing
  const RoutingInitialState({
    super.bottomNavPath = "",
    super.bottomNavBarIndex = 0,
  });
}

/// Use this state to indicate that the app is in
/// the process of loading a new route or performing
/// an asynchronous operation related to navigation.
class RoutingLoadingState extends RoutingState {
  const RoutingLoadingState({
    required super.bottomNavPath,
    required super.bottomNavBarIndex,
  });
}

/// This state represents a successful navigation or
/// routing operation. It can include information about
/// the current route or screen.
class RoutingLoadedState extends RoutingState {
  const RoutingLoadedState({
    required super.bottomNavPath,
    required super.bottomNavBarIndex,
  });
}

/// In case of an error or failed navigation,
/// you can use this state to handle and communicate
/// errors or issues to the user.
class RoutingFailedState extends RoutingState {
  const RoutingFailedState({
    required super.bottomNavPath,
    required super.bottomNavBarIndex,
  });
}

/// This state can represent the current route or screen
/// that the user is on. You can include information
/// about the route/screen in this state, making it
/// easy to manage the current UI.
class RoutingNavigationState extends RoutingState {
  const RoutingNavigationState({
    required super.bottomNavPath,
    required super.bottomNavBarIndex,
  });
}
