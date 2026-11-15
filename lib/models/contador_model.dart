/// Modelo que representa o valor atual do contador.
class ContadorModel {
  const ContadorModel({this.valor = 0});

  final int valor;

  ContadorModel incrementar() => ContadorModel(valor: valor + 1);
}
