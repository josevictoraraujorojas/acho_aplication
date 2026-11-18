import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/theme/app_theme.dart';
import '../viewmodels/cadastro_viewmodel.dart';

/// Formulário de cadastro do Achô.
///
/// Os campos e a validação funcionam localmente. O cadastro remoto
/// será implementado quando o serviço de autenticação estiver disponível.
class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  static const Color _corBorda = Color(0xFFE4ECE7);

  final _formKey = GlobalKey<FormState>();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _senhaController.dispose();
    super.dispose();
  }

  Widget _campo({
    required String rotulo,
    required String dica,
    required String? Function(String?) validator,
    TextEditingController? controller,
    TextInputType? tipoTeclado,
    TextCapitalization capitalizacao = TextCapitalization.none,
    Iterable<String>? preenchimentoAutomatico,
    bool senha = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rotulo,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppTheme.textoPrincipal,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: tipoTeclado,
          textCapitalization: capitalizacao,
          autofillHints: preenchimentoAutomatico,
          obscureText: senha,
          autocorrect: !senha,
          enableSuggestions: !senha,
          decoration: InputDecoration(
            hintText: dica,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: AppTheme.textoSecundario,
            ),
            isDense: true,
            constraints: const BoxConstraints(minHeight: 52),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: _corBorda),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppTheme.verdePrincipal,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: _corBorda),
            ),
          ),
        ),
      ],
    );
  }

  void _mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  void _validarFormulario(CadastroViewModel viewModel) {
    if (!_formKey.currentState!.validate()) return;

    if (!viewModel.aceitouTermos) {
      _mostrarMensagem('É necessário aceitar os termos de uso.');
      return;
    }

    _mostrarMensagem('O envio do cadastro ainda será implementado.');
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CadastroViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // A seta de voltar é adicionada automaticamente pelo Navigator.
        automaticallyImplyLeading: true,
        title: const Text(
          'Criar conta',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppTheme.textoPrincipal,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.textoPrincipal),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Comece a fazer parte da comunidade.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: AppTheme.textoSecundario,
                      ),
                    ),
                    const SizedBox(height: 22),
                    _campo(
                      rotulo: 'Nome completo',
                      dica: 'Como podemos te chamar?',
                      validator: viewModel.validarNome,
                      capitalizacao: TextCapitalization.words,
                      preenchimentoAutomatico: const [AutofillHints.name],
                    ),
                    const SizedBox(height: 18),
                    _campo(
                      rotulo: 'E-mail',
                      dica: 'seuemail@exemplo.com',
                      validator: viewModel.validarEmail,
                      tipoTeclado: TextInputType.emailAddress,
                      preenchimentoAutomatico: const [AutofillHints.email],
                    ),
                    const SizedBox(height: 18),
                    _campo(
                      rotulo: 'Telefone',
                      dica: '(DDD) 99999-9999',
                      validator: viewModel.validarTelefone,
                      tipoTeclado: TextInputType.phone,
                      preenchimentoAutomatico: const [
                        AutofillHints.telephoneNumber,
                      ],
                    ),
                    const SizedBox(height: 18),
                    _campo(
                      rotulo: 'Senha',
                      dica: 'Crie uma senha segura',
                      controller: _senhaController,
                      validator: viewModel.validarSenha,
                      senha: true,
                      preenchimentoAutomatico: const [
                        AutofillHints.newPassword,
                      ],
                    ),
                    const SizedBox(height: 18),
                    _campo(
                      rotulo: 'Confirmar senha',
                      dica: 'Digite novamente sua senha',
                      validator: (valor) => viewModel.validarConfirmacaoSenha(
                        valor,
                        _senhaController.text,
                      ),
                      senha: true,
                      preenchimentoAutomatico: const [
                        AutofillHints.newPassword,
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 24,
                          child: Checkbox(
                            value: viewModel.aceitouTermos,
                            activeColor: AppTheme.verdePrincipal,
                            checkColor: Colors.white,
                            side: const BorderSide(
                              color: AppTheme.verdePrincipal,
                              width: 1,
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            onChanged: (valor) {
                              context.read<CadastroViewModel>().definirAceiteTermos(
                                valor ?? false,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Concordo com os termos de uso e\n'
                            'política de privacidade.',
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.25,
                              color: AppTheme.textoSecundario,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    FilledButton(
                      onPressed: () => _validarFormulario(viewModel),
                      child: const Text(
                        'Criar minha conta',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 16,
                      children: [
                        const Text(
                          'Já possui uma conta?',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textoSecundario,
                          ),
                        ),
                        TextButton(
                          onPressed: () => _mostrarMensagem(
                            'A tela de login ainda será implementada.',
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              color: AppTheme.verdePrincipal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
