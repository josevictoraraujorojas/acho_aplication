import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/boas_vindas_viewmodel.dart';
import '../views/boas_vindas_view.dart';

/// Centraliza as rotas e os Providers específicos de cada tela.
class AppRouter {
  AppRouter._();

  static const String boasVindas = '/';

  static Route<dynamic> gerarRota(RouteSettings settings) {
    switch (settings.name) {
      case boasVindas:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ChangeNotifierProvider(
            create: (_) => BoasVindasViewModel(),
            child: const BoasVindasView(),
          ),
        );
      default:
        throw FlutterError('Rota não cadastrada: ${settings.name}');
    }
  }
}
