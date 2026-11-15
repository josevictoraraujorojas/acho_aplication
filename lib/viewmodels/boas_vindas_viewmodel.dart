import 'package:flutter/foundation.dart';

/// Estado inicial da tela de boas-vindas.
///
/// A navegação para o acesso será ligada quando essa etapa existir.
class BoasVindasViewModel extends ChangeNotifier {
  bool _proximaEtapaPendente = false;

  bool get proximaEtapaPendente => _proximaEtapaPendente;

  void comecar() {
    if (_proximaEtapaPendente) return;

    _proximaEtapaPendente = true;
    notifyListeners();
  }
}
