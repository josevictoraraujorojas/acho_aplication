import 'package:flutter_test/flutter_test.dart';

import 'package:acho_aplication/viewmodels/boas_vindas_viewmodel.dart';

void main() {
  test('Atualiza o estado ao iniciar o fluxo', () {
    final viewModel = BoasVindasViewModel();
    var notificacoes = 0;
    viewModel.addListener(() => notificacoes++);

    expect(viewModel.proximaEtapaPendente, isFalse);

    viewModel.comecar();
    viewModel.comecar();

    expect(viewModel.proximaEtapaPendente, isTrue);
    expect(notificacoes, 1);

    viewModel.dispose();
  });
}
