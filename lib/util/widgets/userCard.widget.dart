import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String usuario = 'Daniel';
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                usuario,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
