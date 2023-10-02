import 'package:flutter/material.dart';

class ScreenCard extends StatelessWidget {
  final String texto;
  final IconData? icone;
  const ScreenCard(this.texto, {this.icone, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Visibility(
          visible: icone != null,
          child: Flexible(
            flex: 1,
            child: Icon(
              icone,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}