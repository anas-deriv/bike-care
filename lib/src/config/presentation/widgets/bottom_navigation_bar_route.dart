import 'package:flutter/cupertino.dart';

/// [BottomNavigationBarRoute] a widget to hold an class of the bottom navigation item
class BottomNavigationBarRoute extends BottomNavigationBarItem {
  final String initialLocation;
  BottomNavigationBarRoute({
    required this.initialLocation,
    required Widget icon,
    required String? label,

  }) : super(
          icon: icon,
          label: label,
        );
}
