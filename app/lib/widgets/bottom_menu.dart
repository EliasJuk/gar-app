import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const BottomMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  static const Color primaryColor = Color(0xFF04ABB1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 92,
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
          children: [
            Expanded(
              child: _MenuItem(
                icon: Icons.pets,
                label: 'Gatos',
                selected: selectedIndex == 1,
                onTap: () => onItemSelected(1),
              ),
            ),
            Expanded(
              child: _CheckoutMenuItem(
                selected: selectedIndex == 2,
                onTap: () => onItemSelected(2),
              ),
            ),
            Expanded(
              child: _MenuItem(
                icon: Icons.medication,
                label: 'Medicação',
                selected: selectedIndex == 3,
                onTap: () => onItemSelected(3),
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
  final bool selected;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = selected
        ? BottomMenu.primaryColor
        : Colors.grey.shade500;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: selected
                  ? FontWeight.w800
                  : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckoutMenuItem extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;

  const _CheckoutMenuItem({
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: BottomMenu.primaryColor,
              shape: BoxShape.circle,
              border: selected
                  ? Border.all(
                      color: const Color(0xFF007E7E),
                      width: 3,
                    )
                  : null,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.pets,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Check-out',
            style: TextStyle(
              color: selected
                  ? BottomMenu.primaryColor
                  : Colors.grey.shade500,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}