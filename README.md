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

- **main.dart:** disponibiliza o `BoasVindasViewModel` com Provider e inicia o app.
- **app/app.dart:** configura `MaterialApp`, o tema e a resolução de rotas.
- **app/app_router.dart:** centraliza as rotas existentes, inicialmente apenas `/` (boas-vindas).
- **core/theme:** centraliza as cores do Achô (branco e verde).
- **views:** cria a interface da tela de boas-vindas.
- **viewmodels:** controla o estado da tela usando `ChangeNotifier`.

A pasta `models/` será criada quando existirem modelos reais do domínio, como usuário ou objeto. Não há modelos artificiais ou novas telas.

## Como funciona o router

Ao abrir o aplicativo, `MaterialApp` utiliza `initialRoute: AppRouter.boasVindas` (`/`).
O `onGenerateRoute` chama `AppRouter.gerarRota`, que retorna a `BoasVindasView`.

Quando a tela de login realmente existir, uma rota correspondente poderá ser adicionada ao router, e então o botão **Entrar** poderá usar `Navigator.pushNamed(context, '/login')`. **A rota de login ainda não existe.**

## Comportamento atual

A tela apresenta o nome Achô, uma ilustração simples, uma apresentação e os botões **Começar** e **Entrar**. O primeiro mostra uma mensagem de etapa pendente; o segundo informa que a tela de login ainda será implementada.

Nenhum cadastro, login, publicação, integração externa ou Firebase foi adicionado.

## Executar e validar

```bash
flutter pub get
flutter run
flutter test
flutter analyze
```

Após `flutter pub get`, atualize e registre o `pubspec.lock` gerado se houver alterações.
