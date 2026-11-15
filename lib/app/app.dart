import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'app_router.dart';

class AchoApp extends StatelessWidget {
  const AchoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Achô',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.claro,
      initialRoute: AppRouter.boasVindas,
      onGenerateRoute: AppRouter.gerarRota,
    );
  }
}
