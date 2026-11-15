import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:acho_aplication/app/app.dart';
import 'package:acho_aplication/viewmodels/boas_vindas_viewmodel.dart';

void main() {
  testWidgets('Exibe a tela de boas-vindas do Achô', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => BoasVindasViewModel(),
        child: const AchoApp(),
      ),
    );

    expect(find.text('achô'), findsOneWidget);
    expect(find.text('O que se perde pode\nser encontrado.'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Começar'), findsOneWidget);

    await tester.ensureVisible(find.text('Começar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Começar'));
    await tester.pump();

    expect(
      find.text('A próxima etapa do aplicativo ainda será implementada.'),
      findsOneWidget,
    );
  });
}
