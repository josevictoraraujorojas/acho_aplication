# Achô — Flutter

Projeto Flutter organizado no padrão **MVVM (Model–View–ViewModel)**.

> **Estado atual:** o repositório contém somente a tela demonstrativa de contador criada pelo Flutter. As telas de cadastro, login, publicações e devolução planejadas para o Achô ainda não foram implementadas neste código. Esta reorganização não adiciona telas nem funcionalidades.

## Estrutura

```text
lib/
├── main.dart                         # Entrada da aplicação
├── app/
│   └── app.dart                      # MaterialApp, tema e rota inicial
├── models/
│   └── contador_model.dart           # Modelo de dados do contador
├── viewmodels/
│   └── contador_viewmodel.dart       # Estado e ações da tela
└── views/
    └── contador_view.dart            # Tela já existente

test/
├── widget_test.dart                   # Teste de interface original
└── contador_viewmodel_test.dart        # Teste do ViewModel
```

## Responsabilidades do MVVM

- **Model:** representa os dados e as regras relacionadas a esses dados, sem depender de widgets.
- **ViewModel:** coordena o estado e as ações da interface, usando `ChangeNotifier` para informar as alterações.
- **View:** apresenta os widgets e reage às mudanças observadas no ViewModel.
- **App:** reúne a configuração do `MaterialApp`, sem misturar as regras da tela.

O contador continua com o mesmo comportamento. A View chama `incrementar()` no ViewModel; o ViewModel atualiza o Model; o `AnimatedBuilder` atualiza somente o texto do contador.

Esta organização utiliza apenas bibliotecas presentes no Flutter, sem adicionar dependências externas. Quando novas funcionalidades forem implementadas, seus modelos, telas e ViewModels poderão ser adicionados nas respectivas pastas. Serviços e repositórios de dados só devem ser introduzidos quando houver necessidade real.

## Executar

```bash
flutter pub get
flutter run
```

## Testar

```bash
flutter test
flutter analyze
```
