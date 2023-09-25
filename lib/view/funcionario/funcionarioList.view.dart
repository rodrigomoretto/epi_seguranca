import 'package:epi_seguranca/controller/funcionario.controller.dart';
import 'package:epi_seguranca/model/funcionario.model.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/widgets/customAppBar.widget.dart';
import 'package:epi_seguranca/util/widgets/customListItem.widget.dart';
import 'package:epi_seguranca/util/widgets/logo.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FuncionarioListView extends StatefulWidget {
  const FuncionarioListView({super.key});

  @override
  State<FuncionarioListView> createState() => _FuncionarioListViewState();
}

class _FuncionarioListViewState extends State<FuncionarioListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: FutureBuilder<List<Funcionario>>(
        future: FuncionarioController().fetchAllFuncionario(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final List<Funcionario> funcionariosList = snapshot.data!;

            return funcionariosList.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Logo(),
                        Center(
                          child: Text(
                            FuncionarioConstants.semFuncionarios,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                    itemCount: funcionariosList.length,
                    itemBuilder: (context, index) {
                      final funcionario = funcionariosList[index];

                      return ListTile(
                        title: index == 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Logo(),
                                  Column(
                                    children: [_item(funcionario)],
                                  )
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [_item(funcionario)],
                              ),
                      );
                    },
                  );
          }
        },
      ),
    );
  }

  Widget _item(Funcionario funcionario) {
    final data = DateFormat.yMd().format(funcionario.cadastro!);
    return CustomListItem(layout: [
      CLayoutItem(
          label: '${FuncionarioConstants.nome}: ', data: funcionario.nome),
      CLayoutItem(
          label: '${FuncionarioConstants.cargo}: ', data: funcionario.cargo),
      CLayoutItem(
          label: '${FuncionarioConstants.departamento} :',
          data: funcionario.departamento),
      CLayoutItem(label: '${FuncionarioConstants.cadastro}: ', data: data),
    ]);
  }
}
