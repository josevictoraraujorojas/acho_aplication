import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color verdePrincipal = Color(0xFF237A53);
  static const Color verdeClaro = Color(0xFFEAF6EF);
  static const Color textoPrincipal = Color(0xFF203129);
  static const Color textoSecundario = Color(0xFF718079);

  static ThemeData get claro => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: verdePrincipal,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: verdePrincipal,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      );
}
