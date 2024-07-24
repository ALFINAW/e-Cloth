import 'package:e_cloth/core/asset/assets.gen.dart';
import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });

    return Scaffold(
      body: Container(
        color: AppColors.premierOne,
        height: MediaQuery.of(context).size.height,
        child: Center(child: Assets.images.logo_white.image(fit: BoxFit.cover)),
      ),
    );
  }
}
