# Achô — Flutter

Aplicativo de achados e perdidos. Este repositório contém **somente a estrutura inicial e a tela de boas-vindas**.

## Estrutura MVVM com Provider

```text
lib/
├── main.dart
├── app/
│   └── app.dart
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

- **main.dart:** registra o `ChangeNotifierProvider` e inicia a aplicação.
- **app/app.dart:** configura `MaterialApp` e define a tela inicial.
- **core/theme:** centraliza o tema visual (branco e verde).
- **views:** contém a única tela existente, sem regras de estado.
- **viewmodels:** fornece o estado da tela usando `ChangeNotifier` e Provider.

A pasta `models/` será adicionada quando existirem modelos reais do domínio, como usuário ou objeto. Não foram criados modelos artificiais.

## Comportamento atual

A tela mostra a marca Achô, uma ilustração simples, uma apresentação e o botão **Começar**. Como ainda não existe tela de autenticação, o botão apenas informa que a próxima etapa será implementada. Não há navegação fictícia.

Nenhum cadastro, login, publicação, integração externa ou Firebase foi adicionado.

## Executar e validar

```bash
flutter pub get
flutter run
flutter test
flutter analyze
```

O `flutter pub get` instala o Provider e atualiza o `pubspec.lock` conforme a resolução local de dependências.
