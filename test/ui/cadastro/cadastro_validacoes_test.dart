import 'package:flutter_test/flutter_test.dart';

import 'package:acho_aplication/ui/cadastro/cadastro_viewmodel.dart';

void main() {
  group('Validações do cadastro', () {
    final viewModel = CadastroViewModel();

    test('nome é obrigatório', () {
      expect(viewModel.validarNome('  '), isNotNull);
      expect(viewModel.validarNome('Ana Silva'), isNull);
    });

    test('e-mail deve ter formato válido', () {
      expect(viewModel.validarEmail('ana'), isNotNull);
      expect(viewModel.validarEmail('ana@exemplo.com'), isNull);
    });

    test('telefone exige DDD e 10 ou 11 dígitos', () {
      expect(viewModel.validarTelefone('1234'), isNotNull);
      expect(viewModel.validarTelefone('(64) 99999-9999'), isNull);
    });

    test('senha deve conter ao menos 8 caracteres', () {
      expect(viewModel.validarSenha('1234567'), isNotNull);
      expect(viewModel.validarSenha('12345678'), isNull);
    });

    test('confirmação deve coincidir com a senha', () {
      expect(
        viewModel.validarConfirmacaoSenha('outraSenha', 'senha1234'),
        isNotNull,
      );
      expect(
        viewModel.validarConfirmacaoSenha('senha1234', 'senha1234'),
        isNull,
      );
    });
  });
}
