import 'package:flutter/foundation.dart';

/// Gerencia o aceite dos termos e as regras básicas do formulário.
///
/// O envio para uma API será adicionado futuramente.
class CadastroViewModel extends ChangeNotifier {
  bool _aceitouTermos = false;

  bool get aceitouTermos => _aceitouTermos;

  void definirAceiteTermos(bool valor) {
    if (_aceitouTermos == valor) return;
    _aceitouTermos = valor;
    notifyListeners();
  }

  String? validarNome(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Informe seu nome completo.';
    }
    return null;
  }

  String? validarEmail(String? valor) {
    final email = valor?.trim() ?? '';
    if (email.isEmpty) return 'Informe seu e-mail.';
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      return 'Informe um e-mail válido.';
    }
    return null;
  }

  String? validarTelefone(String? valor) {
    final digitos = (valor ?? '').replaceAll(RegExp(r'\D'), '');
    if (digitos.isEmpty) return 'Informe seu telefone.';
    if (digitos.length != 10 && digitos.length != 11) {
      return 'Informe o DDD e um telefone válido.';
    }
    return null;
  }

  String? validarSenha(String? valor) {
    if (valor == null || valor.isEmpty) return 'Informe uma senha.';
    if (valor.length < 8) return 'Use pelo menos 8 caracteres.';
    return null;
  }

  String? validarConfirmacaoSenha(String? valor, String senha) {
    if (valor == null || valor.isEmpty) return 'Confirme sua senha.';
    if (valor != senha) return 'As senhas não coincidem.';
    return null;
  }
}
