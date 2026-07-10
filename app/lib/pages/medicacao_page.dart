import 'package:flutter/material.dart';

import '../main.dart';

class MedicacaoPage extends StatelessWidget {
  const MedicacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.medication,
            color: GarColors.primary,
            size: 64,
          ),
          SizedBox(height: 16),
          Text(
            'Tela de medicação',
            style: TextStyle(
              color: GarColors.textDark,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Em desenvolvimento',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}