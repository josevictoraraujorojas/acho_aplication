# Achô — aplicativo Flutter

Aplicativo de achados e perdidos desenvolvido em Flutter, com **MVVM + Provider** e configuração do Firebase.

## Arquitetura

A organização acompanha as recomendações oficiais de arquitetura do Flutter:
[guia](https://docs.flutter.dev/app-architecture/guide) e
[estudo de caso](https://docs.flutter.dev/app-architecture/case-study).

- **UI layer (`lib/ui/`)**: telas e ViewModels organizados por funcionalidade, com tema compartilhado em `ui/core/`.
- **Data layer (`lib/data/`, a criar quando usada)**: Repositories e Services para acesso a Authentication, Firestore e Storage. Nenhuma View deve acessar o Firebase diretamente.
- **Domain (`lib/domain/`, quando necessário)**: modelos de domínio compartilhados e, futuramente, regras de negócio que justifiquem uma camada própria.
- **App (`lib/app/`)**: configuração do MaterialApp, rotas e injeção dos Providers das telas.
- **Firebase (`lib/firebase_options.dart` e `lib/main.dart`)**: configuração gerada pelo FlutterFire e inicialização do SDK.

### Arquivos existentes

```text
lib/
├── main.dart
├── firebase_options.dart
├── app/
│   ├── app.dart
│   └── app_router.dart
└── ui/
    ├── core/
    │   └── theme/
    │       └── app_theme.dart
    ├── boas_vindas/
    │   ├── boas_vindas_view.dart
    │   └── boas_vindas_viewmodel.dart
    └── cadastro/
        ├── cadastro_view.dart
        └── cadastro_viewmodel.dart

test/
└── ui/
    ├── boas_vindas/
    └── cadastro/
```

A estrutura de testes acompanha as funcionalidades presentes em `ui/`.

## Estado atual das funcionalidades

- **Boas-vindas:** botão *Começar* navega para a rota `/cadastro`.
- **Cadastro:** interface com `Form`, cinco `TextFormField`, validações locais e aceite dos termos controlado pelo `CadastroViewModel`.
- **Provider:** ViewModels criados por rota no `AppRouter`.
- **Firebase:** `Firebase.initializeApp` é chamado no `main.dart`; dependências para Authentication, Firestore e Storage constam no `pubspec.yaml`. As operações de autenticação, gravação e upload **ainda não foram implementadas**.

Não foram criados Repositories, Services ou Models fictícios nesta reorganização; eles serão adicionados quando as operações Firebase forem implementadas de fato.

## Executar

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

A execução depende da configuração FlutterFire em `lib/firebase_options.dart`.

## Segurança

`firebase_options.dart` e `android/app/google-services.json` contêm identificadores de cliente e normalmente podem ser versionados.
Nunca publique chaves privadas administrativas, senhas, tokens secretos, credenciais de serviço ou keystores. Configure **Security Rules** adequadas no Firebase Console.
