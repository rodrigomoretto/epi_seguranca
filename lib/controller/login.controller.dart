import 'package:epi_seguranca/controller/usuario.controller.dart';
import 'package:epi_seguranca/model/usuario.model.dart';
import 'package:epi_seguranca/view/home.view.dart';
import 'package:flutter/material.dart';

class LoginController {

  Future<Usuario?> verificaLogin(String usuario, String senha) async {
    Usuario? user = await UsuarioController().fetchByUsernameUsuario(usuario);

    if (user != null) {
      if (user.senha == senha) {
        return user;
      }
      else {
        return null;
      }
    } else {
      return null;
    }
  }

  static void goToHome(BuildContext context, String usuario) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomeView(username: usuario,)));
  }
}