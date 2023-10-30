import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(),
      scaffoldBackgroundColor: Colors.grey[50],
      primaryColor: Colors.red[400],
      splashColor: Colors.transparent,
      fontFamily: 'NotoSans',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.red[400],
      ),
    );
  }
}
