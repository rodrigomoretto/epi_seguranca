import 'package:epi_seguranca/controller/usuario.controller.dart';
import 'package:epi_seguranca/model/usuario.model.dart';
import 'package:epi_seguranca/view/home.view.dart';
import 'package:flutter/material.dart';

class LoginController {

  Future<bool> verificaLogin(String usuario, String senha) async {
    Usuario? user = await UsuarioController().fetchByUsernameUsuario(usuario);

    if (user != null) {
      if (user.senha == senha) {
        return true;
      }
      else {
        return false;
      }
    } else {
      return false;
    }
  }

  static void goToHome(BuildContext context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const HomeView()));
  }
}