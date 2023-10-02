import 'package:epi_seguranca/controller/home.controller.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/cardWrapper.widget.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customCard.widget.dart';
import 'package:epi_seguranca/util/widgets/customView.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:epi_seguranca/util/widgets/userCard.widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final String? username;
  const HomeView({this.username, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: CustomView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Logo(),
            Column(
              children: <Widget>[
                UserCard(
                  usuario: username,
                ),
                CardWrapper(
                  children: <Widget>[
                    CustomCard(
                      texto: HomeConstants.funcionario,
                      icone: Icons.person,
                      funcao: () => HomeController.goToFuncionario(context),
                    ),
                    CustomCard(
                      texto: HomeConstants.epi,
                      icone: Icons.business_center_outlined,
                      funcao: () => HomeController.goToEPI(context),
                    ),
                    CustomCard(
                      texto: HomeConstants.atribuirEpi,
                      icone: Icons.business,
                      funcao: () => HomeController.goToAtribuirEPI(context),
                    ),
                    CustomCard(
                      texto: HomeConstants.relatorios,
                      icone: Icons.article_outlined,
                      funcao: () => HomeController.goToRelatorios(context),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
