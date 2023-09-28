import 'package:epi_seguranca/controller/movimento/movimentoEpi.controller.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customButton.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:flutter/material.dart';

class MovimentoEpiView extends StatelessWidget {
  const MovimentoEpiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Logo(),
                Center(
                  child: Column(
                    children: [
                      CustomButton(
                        funcao: () => MovimentoEpiController.goToAtribuirEPI(context),
                        texto: MovimentoEpiConstants.atribuirEpi,
                      ),
                      CustomButton(
                        funcao: () {},
                        texto: MovimentoEpiConstants.devolucaoEpi,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}