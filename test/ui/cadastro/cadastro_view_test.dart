import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:acho_aplication/app/app.dart';
import 'package:acho_aplication/app/app_router.dart';

void main() {
  testWidgets('Router disponibiliza o CadastroViewModel para a CadastroView',
      (tester) async {
    await tester.pumpWidget(const AchoApp());

    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    navigator.pushNamed(AppRouter.cadastro);
    await tester.pumpAndSettle();

    expect(find.text('Criar conta'), findsOneWidget);
    expect(find.text('Nome completo'), findsOneWidget);
    expect(find.text('Telefone'), findsOneWidget);

    final checkbox = find.byType(Checkbox);
    await tester.ensureVisible(checkbox);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(checkbox).value, isFalse);

    await tester.tap(checkbox);
    await tester.pump();
    expect(tester.widget<Checkbox>(checkbox).value, isTrue);
  });
}
