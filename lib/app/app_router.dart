import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/boas_vindas/boas_vindas_view.dart';
import '../ui/boas_vindas/boas_vindas_viewmodel.dart';
import '../ui/cadastro/cadastro_view.dart';
import '../ui/cadastro/cadastro_viewmodel.dart';

/// Centraliza as rotas e os Providers específicos de cada tela.
class AppRouter {
  AppRouter._();

  static const String boasVindas = '/';
  static const String cadastro = '/cadastro';

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
      case cadastro:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ChangeNotifierProvider(
            create: (_) => CadastroViewModel(),
            child: const CadastroView(),
          ),
        );
      default:
        throw FlutterError('Rota não cadastrada: ${settings.name}');
    }
  }
}
