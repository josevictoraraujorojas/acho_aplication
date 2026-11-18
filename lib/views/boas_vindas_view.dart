import 'package:acho_aplication/app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/theme/app_theme.dart';
import '../viewmodels/boas_vindas_viewmodel.dart';

/// Primeira tela do Achô. Não implementa cadastro ou login.
class BoasVindasView extends StatelessWidget {
  const BoasVindasView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BoasVindasViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'achô',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.verdePrincipal,
                    ),
                  ),
                  const SizedBox(height: 52),
                  Center(
                    child: Container(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        color: AppTheme.verdeClaro,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: const Icon(
                        Icons.inventory_2_outlined,
                        size: 96,
                        color: AppTheme.verdePrincipal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'O que se perde pode\nser encontrado.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textoPrincipal,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Um lugar para reunir pessoas e ajudar objetos '
                    'a voltarem para casa.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.textoSecundario,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 50),
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.cadastro);
                    },
                    child: const Text('Começar'),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Já tenho uma conta?',
                        style: TextStyle(color: AppTheme.textoSecundario),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'A tela de login ainda será implementada.',
                              ),
                            ),
                          );
                        },
                        child: const Text('Entrar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
