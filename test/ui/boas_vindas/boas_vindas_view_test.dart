import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:acho_aplication/app/app.dart';
import 'package:acho_aplication/ui/cadastro/cadastro_view.dart';

void main() {
  testWidgets('Exibe a tela de boas-vindas do Achô', (tester) async {
    // O Router configura os Providers específicos de cada rota.
    await tester.pumpWidget(const AchoApp());

    expect(find.text('achô'), findsOneWidget);
    expect(find.text('O que se perde pode\nser encontrado.'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Começar'), findsOneWidget);
    expect(find.text('Já tenho uma conta?'), findsOneWidget);
    expect(find.widgetWithText(TextButton, 'Entrar'), findsOneWidget);

    await tester.ensureVisible(find.text('Começar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Começar'));
    await tester.pump();

    await tester.pumpAndSettle();

    expect(find.byType(CadastroView), findsOneWidget);
    expect(find.text('Criar conta'), findsOneWidget);
  });
}
