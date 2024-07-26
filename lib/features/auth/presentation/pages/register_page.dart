import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:e_cloth/features/auth/presentation/widget/button.dart';
import 'package:e_cloth/features/auth/presentation/widget/text_field.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              const SizedBox(height: 40.0),
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
                helper:
                    "The password must be at least 8 characters long, and consists of letters and numbers, only the -_.@ symbol can be used",
                onChanged: (value) {},
              ),
              const Row(
                children: [
                  Text(
                    "Name",
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
                    "Phone number",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              MyTextField(
                value: null,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {},
              ),
              const Row(
                children: [
                  Text(
                    "Date of birth",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              MyTextField(
                isDatePicker: true,
                helper:
                    "Cannot change your date of birth once you have registered",
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 20.0),
              MyButton(
                  label: 'Continue',
                  buttonColor: AppColors.secondaryOne,
                  labelColor: AppColors.premierTwo,
                  suffixIcon: Icons.arrow_right,
                  onPressed: () => {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           const BasicMainNavigationView()),
                        // )
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
