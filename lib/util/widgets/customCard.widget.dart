import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String texto;
  final IconData icone;
  final Function()? funcao;
  
  const CustomCard({required this.texto, required this.icone, this.funcao, super.key});

  @override
  Widget build(BuildContext context) {
    BorderRadius border = const BorderRadius.all(Radius.circular(10));
    return InkWell(
      borderRadius: border,
      onTap: funcao,
      child: Card(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).width > 450
            ? MediaQuery.sizeOf(context).width / 5
            : MediaQuery.sizeOf(context).width / 3,
          width: MediaQuery.sizeOf(context).width > 450
            ? MediaQuery.sizeOf(context).width / 5
            : MediaQuery.sizeOf(context).width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icone,
                size: 100,
              ),
              Text(
                texto,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}