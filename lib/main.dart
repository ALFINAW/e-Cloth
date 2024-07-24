import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:e_cloth/features/auth/presentation/pages/login_page.dart';
import 'package:e_cloth/features/auth/presentation/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Cloth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.premierTwo),
        useMaterial3: true,
      ),
      home: const SplashScreenPage(),
      routes: {
        '/login': (context) => const LoginPage(),
      },
      onGenerateRoute: (routeSettings) {
        print(routeSettings.name);
        return null;
      },
    );
  }
}
