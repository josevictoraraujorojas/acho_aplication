# Achô — Flutter

Aplicativo de achados e perdidos. Este repositório contém **somente a estrutura inicial e a tela de boas-vindas**.

## Estrutura MVVM com Provider

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   └── app_router.dart
├── core/
│   └── theme/
│       └── app_theme.dart
├── views/
│   └── boas_vindas_view.dart
└── viewmodels/
    └── boas_vindas_viewmodel.dart

test/
├── widget_test.dart
└── boas_vindas_viewmodel_test.dart
```

- **main.dart:** apenas inicia o `AchoApp`.
- **app/app.dart:** configura o `MaterialApp`, tema e roteamento.
- **app/app_router.dart:** define as rotas e registra os Providers de cada tela.
- **core/theme:** centraliza o tema branco e verde.
- **views:** contém a interface de boas-vindas.
- **viewmodels:** controla o estado da tela por meio de `ChangeNotifier`.

Não há Models fictícios; `models/` será criada quando houver entidades reais.

## Roteamento e Provider

O `MaterialApp` usa `initialRoute: AppRouter.boasVindas` (`/`) e chama `AppRouter.gerarRota`.
Essa rota fornece um `ChangeNotifierProvider<BoasVindasViewModel>` que envolve `BoasVindasView`.
O ViewModel é criado ao construir a rota e descartado pelo Provider quando ela sai da árvore.
Não é necessário registrar o mesmo ViewModel no `main.dart`.

Quando houver uma tela de login, poderemos adicionar sua rota e seu Provider correspondente. Por enquanto, somente a tela de boas-vindas existe.

## Comportamento atual

O botão **Começar** apenas exibe uma mensagem de etapa pendente. O botão **Entrar** informa que o login ainda será implementado. Não há navegação para telas inexistentes.

Nenhum cadastro, login, publicação, integração externa ou Firebase foi adicionado.

## Executar e validar

```bash
flutter pub get
flutter run
flutter test
flutter analyze
```

Após `flutter pub get`, registre eventuais alterações em `pubspec.lock`.
