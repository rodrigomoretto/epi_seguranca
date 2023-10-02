import 'package:epi_seguranca/controller/login.controller.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/textForm.utils.dart';
import 'package:epi_seguranca/util/widgets/customButton.widget.dart';
import 'package:epi_seguranca/util/widgets/customTextForm.widget.dart';
import 'package:epi_seguranca/util/widgets/customView.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _senhaController = TextEditingController.fromValue(TextEditingValue.empty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Logo(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextForm(
                      controller: _usernameController, 
                      texto: LoginConstants.nomeUsuario,
                      validador: (value) => TextFormUtils().defaultValidator(
                        value,
                        LoginConstants.nomeUsuarioValidacao
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextForm(
                      controller: _senhaController, 
                      texto: LoginConstants.senha,
                      validador: (value) => TextFormUtils().defaultValidator(
                        value,
                        LoginConstants.senhaValidacao
                      ),
                      esconder: true,
                    ),
                  ),
                ],
              ),
              CustomButton(
                texto: LoginConstants.login,
                funcao: _realizaLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _realizaLogin() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      final resultado = await LoginController().verificaLogin(
        _usernameController.text, _senhaController.text
      );
      if (resultado == null) {
        if (!context.mounted) return;
        showAdaptiveDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog.adaptive(
            title: const Text(ApplicationConstants.aviso),
            content: const Text(LoginConstants.usuarioSenhaInvalido),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(ApplicationConstants.ok),
              )
            ],
          ),
        );
        _usernameController.clear();
        _senhaController.clear();
      } else {
        if (!context.mounted) return;
        LoginController.goToHome(context, resultado.nome);
      }
    }
  }
}