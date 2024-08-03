import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:e_cloth/features/auth/presentation/widget/button.dart';
import 'package:e_cloth/features/auth/presentation/widget/text_field.dart';
import 'package:e_cloth/features/home/presentation/widget/dropdown.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedCourier;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 10),
        child: AppBar(
          title: const Text('Payment Method'),
          leading: IconButton(
            icon: Assets.icons.back.image(fit: BoxFit.cover),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Container(
                  color: Colors.grey,
                  height: 1.0,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Summary",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Row(
                    children: [
                      Text(
                        "Subtotal",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Rp. 650.000",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Row(
                    children: [
                      Text(
                        "Shipment Price",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Rp. 17.000",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: AppColors.premierOne,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Choose Courier",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  MyDropdown(
                    hint: 'Select one',
                    value: selectedCourier,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCourier = newValue;
                      });
                    },
                    width: MediaQuery.of(context).size.width,
                    height: 51,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    borderColor: Colors.grey,
                    items: const [
                      'JNE - Reguler Rp. 17000',
                      'JNT - Reguler Rp. 17000',
                      'JNE - Expres Rp. 20000'
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  MyTextField(
                    value: null,
                    hint: 'Provinsi, Kabupaten, Kecamatan, Desa/Kelurahan',
                    margin: const EdgeInsets.only(bottom: 5),
                    onChanged: (value) {},
                  ),
                  Row(
                    children: [
                      MyTextField(
                        value: null,
                        hint: 'RT/RW',
                        width: 230,
                        margin: const EdgeInsets.only(bottom: 5),
                        onChanged: (value) {},
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: MyTextField(
                          value: null,
                          hint: 'Nomor rumah',
                          margin: const EdgeInsets.only(bottom: 5),
                          onChanged: (value) {},
                        ),
                      )
                    ],
                  ),
                  MyTextField(
                    value: null,
                    hint: 'Ancer-ancer',
                    margin: const EdgeInsets.only(bottom: 11),
                    onChanged: (value) {},
                  ),
                  const Text(
                    "Note",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  MyTextField(
                    value: null,
                    hint: 'Catatan',
                    onChanged: (value) {},
                    maxLines: 6,
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    "Send Receipt to",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  MyTextField(
                    value: null,
                    hint: 'Email or phone',
                    margin: const EdgeInsets.only(bottom: 11),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 10.0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        fillColor: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
                              return AppColors.premierOne;
                            }
                            return null;
                          },
                        ),
                        checkColor: Colors.white,
                      ),
                      const Text("I agree to payment Terms & Condition"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, bottom: 20, top: 10),
                  child: MyButton(
                    label: 'Checkout',
                    buttonColor: AppColors.premierOne,
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentPage(),
                        ),
                      )
                    },
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
