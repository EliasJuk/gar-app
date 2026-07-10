import 'package:flutter/material.dart';

import '../main.dart';

class ChecklistItem {
  final String title;
  bool checked;

  ChecklistItem({
    required this.title,
    this.checked = false,
  });
}

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final List<ChecklistItem> items = [
    ChecklistItem(title: 'Trocar água'),
    ChecklistItem(title: 'Completar ração'),
    ChecklistItem(title: 'Lavar potes'),
  ];

  int get completedItems {
    return items.where((item) => item.checked).length;
  }

  bool get allCompleted {
    return completedItems == items.length;
  }

  void toggleItem(int index, bool? value) {
    setState(() {
      items[index].checked = value ?? false;
    });
  }

  void finishChecklist() {
    if (!allCompleted) {
      final pendingItems = items.length - completedItems;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            pendingItems == 1
                ? 'Ainda existe 1 tarefa pendente.'
                : 'Ainda existem $pendingItems tarefas pendentes.',
          ),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Checklist concluído!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      children: [
        const Text(
          'Checklist do turno',
          style: TextStyle(
            color: GarColors.textDark,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '$completedItems de ${items.length} tarefas concluídas',
          style: TextStyle(
            color: GarColors.textDark.withOpacity(0.65),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 18),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: completedItems / items.length,
            minHeight: 8,
            backgroundColor: GarColors.primary.withOpacity(0.15),
            color: GarColors.primary,
          ),
        ),
        const SizedBox(height: 24),
        ...List.generate(
          items.length,
          (index) {
            final item = items[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                child: CheckboxListTile(
                  value: item.checked,
                  onChanged: (value) => toggleItem(index, value),
                  activeColor: GarColors.primary,
                  checkColor: Colors.white,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(
                      color: item.checked
                          ? GarColors.primary
                          : Colors.grey.shade300,
                    ),
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      color: item.checked
                          ? GarColors.textDark.withOpacity(0.45)
                          : GarColors.textDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      decoration: item.checked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 54,
          child: FilledButton.icon(
            onPressed: finishChecklist,
            icon: const Icon(Icons.check_circle_outline),
            label: const Text(
              'Concluir turno',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: GarColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}