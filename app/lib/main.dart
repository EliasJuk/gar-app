import 'package:flutter/material.dart';

void main() {
  runApp(const GarApp());
}

class GarApp extends StatelessWidget {
  const GarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GAR App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: GarColors.primary,
        useMaterial3: true,
        scaffoldBackgroundColor: GarColors.background,
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(),
    );
  }
}

class GarColors {
  static const Color primary = Color(0xFF00AFAF);
  static const Color primaryDark = Color(0xFF007E7E);
  static const Color background = Color(0xFFF4F8F8);
  static const Color textDark = Color(0xFF123333);
  static const Color card = Colors.white;
}

enum UserRole {
  admin,
  volunteer,
}

class LocalUser {
  final String name;
  final UserRole role;

  const LocalUser({
    required this.name,
    required this.role,
  });

  bool get isAdmin => role == UserRole.admin;
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();

  UserRole selectedRole = UserRole.volunteer;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void login() {
    final name = nameController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informe o nome do voluntário.'),
        ),
      );
      return;
    }

    final user = LocalUser(
      name: name,
      role: selectedRole,
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => HomePage(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GarColors.primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 420),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: GarColors.card,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 28,
                    offset: const Offset(0, 14),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'gar',
                    style: TextStyle(
                      fontSize: 64,
                      height: 1,
                      fontWeight: FontWeight.w900,
                      color: GarColors.primary,
                      letterSpacing: -4,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Grupo de auxílio aos resgatinhos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: GarColors.textDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 32),

                  TextField(
                    controller: nameController,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => login(),
                    decoration: InputDecoration(
                      labelText: 'Nome do voluntário',
                      hintText: '',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Perfil de acesso',
                      style: TextStyle(
                        color: GarColors.textDark.withOpacity(0.8),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: RoleButton(
                          label: 'Voluntário',
                          icon: Icons.volunteer_activism,
                          selected: selectedRole == UserRole.volunteer,
                          onTap: () {
                            setState(() {
                              selectedRole = UserRole.volunteer;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RoleButton(
                          label: 'Admin',
                          icon: Icons.admin_panel_settings,
                          selected: selectedRole == UserRole.admin,
                          onTap: () {
                            setState(() {
                              selectedRole = UserRole.admin;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: GarColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: login,
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Login local apenas para testes',
                    style: TextStyle(
                      color: GarColors.textDark.withOpacity(0.55),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const RoleButton({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? GarColors.primary : Colors.grey.shade600;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: selected
              ? GarColors.primary.withOpacity(0.12)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? GarColors.primary : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    );
  }
}