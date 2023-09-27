import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customButton.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:flutter/material.dart';

class AtribuiDevolveEpiView extends StatelessWidget {
  const AtribuiDevolveEpiView({super.key});

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
                        funcao: () {},
                        texto: AtribuiDevolveEpiConstants.atribuirEpi,
                      ),
                      CustomButton(
                        funcao: () {},
                        texto: AtribuiDevolveEpiConstants.devolucaoEpi,
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