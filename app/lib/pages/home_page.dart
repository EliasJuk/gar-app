import 'package:flutter/material.dart';

import '../main.dart';
import '../models/local_user.dart';
import '../widgets/bottom_menu.dart';
import 'avisos_page.dart';
import 'checkout_page.dart';
import 'gatos_page.dart';
import 'medicacao_page.dart';

class HomePage extends StatefulWidget {
  final LocalUser user;

  const HomePage({
    super.key,
    required this.user,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void returnToAvisos() {
    setState(() {
      selectedIndex = 0;
    });
  }

  String get pageTitle {
    switch (selectedIndex) {
      case 1:
        return 'Gatos';
      case 2:
        return 'Check-out';
      case 3:
        return 'Medicação';
      default:
        return 'Avisos';
    }
  }

  Widget get currentPage {
    switch (selectedIndex) {
      case 1:
        return const GatosPage();
      case 2:
        return const CheckoutPage();
      case 3:
        return const MedicacaoPage();
      default:
        return AvisosPage(user: widget.user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GarColors.background,
      appBar: AppBar(
        backgroundColor: GarColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: selectedIndex == 0
            ? null
            : IconButton(
                tooltip: 'Voltar para avisos',
                icon: const Icon(Icons.arrow_back),
                onPressed: returnToAvisos,
              ),
        title: Text(
          pageTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        child: KeyedSubtree(
          key: ValueKey(selectedIndex),
          child: currentPage,
        ),
      ),
      bottomNavigationBar: BottomMenu(
        selectedIndex: selectedIndex,
        onItemSelected: selectPage,
      ),
    );
  }
}