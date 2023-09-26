import 'package:epi_seguranca/controller/home.controller.dart';
import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String? usuario;
  const UserCard({required this.usuario, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showAdaptiveDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog.adaptive(
          title: const Text(ApplicationConstants.aviso),
          content: const Text(ApplicationConstants.trocarUsuario,),
          actions: [
            TextButton(
              onPressed: () => HomeController.goToLogin(context),
              child: const Text(ApplicationConstants.sim)
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(ApplicationConstants.nao)
            ),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  ApplicationConstants.bemVindo,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  usuario ?? '',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
