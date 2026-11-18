import 'package:flutter_test/flutter_test.dart';

import 'package:acho_aplication/ui/boas_vindas/boas_vindas_viewmodel.dart';

void main() {
  test('Estado inicial da tela de boas-vindas', () {
    final viewModel = BoasVindasViewModel();

    expect(viewModel.proximaEtapaPendente, isFalse);

    viewModel.dispose();
  });
}
