import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

/// Interface de cadastro do Achô.
///
/// Nesta etapa, a tela não realiza cadastro, validação ou navegação.
/// Essas responsabilidades serão conectadas ao ViewModel posteriormente.
class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  static const _corBorda = Color(0xFFE4ECE7);

  bool _mostrarSenha = false;
  bool _mostrarConfirmacao = false;
  bool _aceitouTermos = false;

  void _mostrarFuncionalidadePendente(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  Widget _campo({
    required String rotulo,
    required String dica,
    TextInputType? tipoTeclado,
    TextCapitalization capitalizacao = TextCapitalization.none,
    Iterable<String>? preenchimentoAutomatico,
    bool ocultarTexto = false,
    Widget? iconeFinal,
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
        TextField(
          keyboardType: tipoTeclado,
          textCapitalization: capitalizacao,
          autofillHints: preenchimentoAutomatico,
          obscureText: ocultarTexto,
          autocorrect: !ocultarTexto,
          enableSuggestions: !ocultarTexto,
          decoration: InputDecoration(
            hintText: dica,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: AppTheme.textoSecundario,
            ),
            suffixIcon: iconeFinal,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      tooltip: 'Voltar',
                      icon: const Icon(Icons.arrow_back),
                      color: AppTheme.textoPrincipal,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Criar conta',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textoPrincipal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Faça parte do Achô e ajude objetos a voltarem '
                    'para seus donos.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: AppTheme.textoSecundario,
                    ),
                  ),
                  const SizedBox(height: 28),
                  _campo(
                    rotulo: 'Nome completo',
                    dica: 'Digite seu nome completo',
                    capitalizacao: TextCapitalization.words,
                    preenchimentoAutomatico: const [AutofillHints.name],
                  ),
                  const SizedBox(height: 18),
                  _campo(
                    rotulo: 'E-mail',
                    dica: 'seuemail@exemplo.com',
                    tipoTeclado: TextInputType.emailAddress,
                    preenchimentoAutomatico: const [AutofillHints.email],
                  ),
                  const SizedBox(height: 18),
                  _campo(
                    rotulo: 'Telefone',
                    dica: '(00) 00000-0000',
                    tipoTeclado: TextInputType.phone,
                    preenchimentoAutomatico: const [
                      AutofillHints.telephoneNumber,
                    ],
                  ),
                  const SizedBox(height: 18),
                  _campo(
                    rotulo: 'Senha',
                    dica: 'Crie uma senha',
                    ocultarTexto: !_mostrarSenha,
                    preenchimentoAutomatico: const [AutofillHints.newPassword],
                    iconeFinal: IconButton(
                      tooltip: _mostrarSenha ? 'Ocultar senha' : 'Mostrar senha',
                      icon: Icon(
                        _mostrarSenha
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppTheme.textoSecundario,
                      ),
                      onPressed: () {
                        setState(() => _mostrarSenha = !_mostrarSenha);
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  _campo(
                    rotulo: 'Confirmar senha',
                    dica: 'Repita sua senha',
                    ocultarTexto: !_mostrarConfirmacao,
                    preenchimentoAutomatico: const [AutofillHints.newPassword],
                    iconeFinal: IconButton(
                      tooltip: _mostrarConfirmacao
                          ? 'Ocultar confirmação'
                          : 'Mostrar confirmação',
                      icon: Icon(
                        _mostrarConfirmacao
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppTheme.textoSecundario,
                      ),
                      onPressed: () {
                        setState(
                          () => _mostrarConfirmacao = !_mostrarConfirmacao,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _aceitouTermos,
                        activeColor: AppTheme.verdePrincipal,
                        onChanged: (valor) {
                          setState(() => _aceitouTermos = valor ?? false);
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'Li e concordo com os Termos de uso '
                          'e a Política de privacidade.',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.4,
                            color: AppTheme.textoSecundario,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  FilledButton(
                    onPressed: () => _mostrarFuncionalidadePendente(
                      'O cadastro será implementado em uma próxima etapa.',
                    ),
                    child: const Text('Criar conta'),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        'Já tenho uma conta?',
                        style: TextStyle(
                          color: AppTheme.textoSecundario,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () => _mostrarFuncionalidadePendente(
                          'A tela de login ainda será implementada.',
                        ),
                        child: const Text('Entrar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
