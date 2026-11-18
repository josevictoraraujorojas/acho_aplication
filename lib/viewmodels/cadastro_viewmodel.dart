import 'package:flutter/foundation.dart';

/// Estado inicial do formulário de cadastro.
///
/// Neste momento, gerencia somente o aceite dos termos de uso.
/// Validação e envio do cadastro serão implementados posteriormente.
class CadastroViewModel extends ChangeNotifier {
  bool _aceitouTermos = false;

  bool get aceitouTermos => _aceitouTermos;

  void definirAceiteTermos(bool valor) {
    if (_aceitouTermos == valor) return;

    _aceitouTermos = valor;
    notifyListeners();
  }
}
