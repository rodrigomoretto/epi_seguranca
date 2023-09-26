import 'package:epi_seguranca/controller/login.controller.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customTextForm.widget.dart';
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
      body: Form(
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
                    validador: (value) => value != null && value.isEmpty
                      ? LoginConstants.nomeUsuarioValidacao
                      : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextForm(
                    controller: _senhaController, 
                    texto: LoginConstants.senha,
                    validador: (value) => value != null && value.isEmpty
                      ? LoginConstants.senhaValidacao
                      : null,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      final resultado = await LoginController().verificaLogin(
                        _usernameController.text, _senhaController.text
                      );
                      if (!resultado) {
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
                        LoginController.goToHome(context);
                      }
                    }
                  },
                  child: const Text(
                    LoginConstants.login,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}