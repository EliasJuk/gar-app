import 'package:flutter/material.dart';

import '../main.dart';
import '../models/local_user.dart';

class AvisosPage extends StatelessWidget {
  final LocalUser user;

  const AvisosPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Olá, ${user.name}!',
          style: const TextStyle(
            color: GarColors.textDark,
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Confira os avisos antes de iniciar o turno.',
          style: TextStyle(
            color: GarColors.textDark.withOpacity(0.65),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 24),
        const _NoticeCard(
          icon: Icons.info_outline,
          title: 'Bem-vindo ao GAR',
          description:
              'Esta é uma tela de avisos de exemplo. Os avisos reais serão adicionados futuramente.',
        ),
        const SizedBox(height: 14),
        const _NoticeCard(
          icon: Icons.water_drop_outlined,
          title: 'Atenção aos bebedouros',
          description:
              'Confira se todos os gatos possuem água limpa e fresca.',
        ),
        const SizedBox(height: 14),
        const _NoticeCard(
          icon: Icons.cleaning_services_outlined,
          title: 'Organização',
          description:
              'Após o turno, deixe os potes e materiais organizados.',
        ),
      ],
    );
  }
}

class _NoticeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _NoticeCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: GarColors.primary.withOpacity(0.25),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: GarColors.primary.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: GarColors.primary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: GarColors.textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    color: GarColors.textDark.withOpacity(0.7),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}