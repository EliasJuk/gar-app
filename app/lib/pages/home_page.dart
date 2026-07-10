import 'package:flutter/material.dart';

import '../main.dart';
import '../models/local_user.dart';
import '../widgets/bottom_menu.dart';

class HomePage extends StatelessWidget {
  final LocalUser user;

  const HomePage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GAR App'),
        backgroundColor: GarColors.primary,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Text(
          'Olá, ${user.name}!\nPerfil: ${user.isAdmin ? 'Admin' : 'Voluntário'}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: GarColors.textDark,
          ),
        ),
      ),

      bottomNavigationBar: const BottomMenu(),
    );
  }
}