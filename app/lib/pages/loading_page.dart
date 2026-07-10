import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';
import '../models/local_user.dart';
import '../widgets/sprite_animation.dart';
import 'home_page.dart';

class LoadingPage extends StatefulWidget {
  final LocalUser user;

  const LoadingPage({
    super.key,
    required this.user,
  });

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Timer? navigationTimer;

  @override
  void initState() {
    super.initState();

    navigationTimer = Timer(
      const Duration(seconds: 4),
      openHomePage,
    );
  }

  void openHomePage() {
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => HomePage(
          user: widget.user,
        ),
      ),
    );
  }

  @override
  void dispose() {
    navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GarColors.primary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/gar_logo.svg',
                  width: 150,
                ),
                const SizedBox(height: 12),
                SvgPicture.asset(
                  'assets/icons/gar_subtitle.svg',
                  width: 230,
                ),
                const SizedBox(height: 70),
                const SpriteAnimation(
                  asset: 'assets/loading/loading.png',
                  rows: 3,
                  columns: 4,
                  fps: 6,
                  width: 180,
                  height: 180,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}