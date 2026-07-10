import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 84,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 12,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: const [
            Expanded(
              child: _MenuItem(
                icon: Icons.pets,
                label: 'Gatos',
              ),
            ),

            Expanded(
              child: _CenterButton(),
            ),

            Expanded(
              child: _MenuItem(
                icon: Icons.medication,
                label: 'Medicação',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF00AFAF);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 28,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _CenterButton extends StatelessWidget {
  const _CenterButton();

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF00AFAF);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color,
          child: Icon(
            Icons.pets,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Check-out',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}