import 'package:epi_seguranca/view/movimento/movimentoEpi.view.dart';
import 'package:epi_seguranca/view/epi/epiCrud.view.dart';
import 'package:epi_seguranca/view/funcionario/funcionarioCrud.view.dart';
import 'package:epi_seguranca/view/login.view.dart';
import 'package:epi_seguranca/view/relatorio/relatorio.view.dart';
import 'package:flutter/material.dart';

class HomeController {
  static void goToFuncionario(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FuncionarioCrudView()));
  }

  static void goToEPI(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const EpiCrudView()));
  }

  static void goToAtribuirEPI(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MovimentoEpiView()));
  }

  static void goToRelatorios(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RelatorioView()));
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const LoginView()));
  }
}
