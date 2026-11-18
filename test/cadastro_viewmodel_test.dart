import 'package:flutter_test/flutter_test.dart';

import 'package:acho_aplication/viewmodels/cadastro_viewmodel.dart';

void main() {
  test('CadastroViewModel notifica apenas quando o aceite dos termos muda', () {
    final viewModel = CadastroViewModel();
    var notificacoes = 0;

    viewModel.addListener(() => notificacoes++);

    expect(viewModel.aceitouTermos, isFalse);

    viewModel.definirAceiteTermos(true);
    expect(viewModel.aceitouTermos, isTrue);
    expect(notificacoes, 1);

    viewModel.definirAceiteTermos(true);
    expect(notificacoes, 1);

    viewModel.definirAceiteTermos(false);
    expect(viewModel.aceitouTermos, isFalse);
    expect(notificacoes, 2);

    viewModel.dispose();
  });
}
