import 'package:flutter/material.dart';

import '../views/boas_vindas_view.dart';

/// Centraliza as rotas do Achô.
///
/// Por enquanto, somente a tela de boas-vindas está implementada.
class AppRouter {
  AppRouter._();

  static const String boasVindas = '/';

  static Route<dynamic> gerarRota(RouteSettings settings) {
    switch (settings.name) {
      case boasVindas:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const BoasVindasView(),
        );
      default:
        throw FlutterError('Rota não cadastrada: ${settings.name}');
    }
  }
}
