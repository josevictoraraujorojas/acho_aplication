import 'package:flutter/foundation.dart';

import '../models/contador_model.dart';

/// Mantém o estado do contador e notifica a interface quando ele muda.
class ContadorViewModel extends ChangeNotifier {
  ContadorModel _estado = const ContadorModel();

  int get contador => _estado.valor;

  void incrementar() {
    _estado = _estado.incrementar();
    notifyListeners();
  }
}
