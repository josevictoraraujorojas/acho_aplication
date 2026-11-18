import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:acho_aplication/app/app.dart';
import 'package:acho_aplication/app/app_router.dart';

void main() {
  testWidgets('Formulário de cadastro exibe erros para campos vazios',
      (tester) async {
    await tester.pumpWidget(const AchoApp());

    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    navigator.pushNamed(AppRouter.cadastro);
    await tester.pumpAndSettle();

    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(5));

    final botao = find.widgetWithText(FilledButton, 'Criar minha conta');
    await tester.ensureVisible(botao);
    await tester.pumpAndSettle();
    await tester.tap(botao);
    await tester.pumpAndSettle();

    expect(find.text('Informe seu nome completo.'), findsOneWidget);
    expect(find.text('Informe seu e-mail.'), findsOneWidget);
    expect(find.text('Informe seu telefone.'), findsOneWidget);
    expect(find.text('Informe uma senha.'), findsOneWidget);
    expect(find.text('Confirme sua senha.'), findsOneWidget);
  });
}
