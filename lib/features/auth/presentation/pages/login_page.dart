import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:e_cloth/features/auth/presentation/pages/register_page.dart';
import 'package:e_cloth/features/auth/presentation/widget/button.dart';
import 'package:e_cloth/features/auth/presentation/widget/text_field.dart';
import 'package:e_cloth/features/home/presentation/pages/main_navigation.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.02;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Assets.images.logoRed.image(fit: BoxFit.cover),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 130.0),
              const Row(
                children: [
                  Text(
                    "Email",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              MyTextField(
                value: null,
                onChanged: (value) {},
              ),
              const Row(
                children: [
                  Text(
                    "Password",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              MyTextField(
                value: null,
                suffixIcon: Icons.visibility_off,
                obscure: true,
                onChanged: (value) {},
              ),
              const SizedBox(height: 15.0),
              MyButton(
                  label: 'Continue',
                  buttonColor: AppColors.secondaryOne,
                  labelColor: AppColors.premierTwo,
                  suffixIcon: Icons.arrow_right,
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainNavigation()),
                        )
                      }),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: const Text(
                      'or',
                      style: TextStyle(
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              MyButton(
                  label: 'Sign up with Google',
                  icon: Assets.images.logoGoogle.image(fit: BoxFit.fill),
                  buttonColor: Colors.transparent,
                  labelColor: AppColors.secondaryOne,
                  borderColor: Colors.grey,
                  borderWidth: 1.0,
                  onPressed: () => {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           const BasicMainNavigationView()),
                        // )
                      }),
              const SizedBox(height: 20.0),
              MyButton(
                  label: 'Make new account',
                  buttonColor: Colors.transparent,
                  labelColor: AppColors.secondaryOne,
                  borderColor: Colors.grey,
                  borderWidth: 1.0,
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        )
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
