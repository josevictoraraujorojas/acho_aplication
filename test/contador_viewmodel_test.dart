import 'package:flutter_test/flutter_test.dart';
import 'package:acho_aplication/viewmodels/contador_viewmodel.dart';

void main() {
  test('Contador inicia em zero e notifica a View ao incrementar', () {
    final viewModel = ContadorViewModel();
    var notificacoes = 0;

    viewModel.addListener(() => notificacoes++);

    expect(viewModel.contador, 0);

    viewModel.incrementar();

    expect(viewModel.contador, 1);
    expect(notificacoes, 1);

    viewModel.dispose();
  });
}
