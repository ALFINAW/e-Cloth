import 'package:e_cloth/features/home/presentation/pages/cart_page.dart';
import 'package:e_cloth/features/home/presentation/widget/dropdown.dart';
import 'package:e_cloth/features/home/presentation/widget/search_field.dart';
import 'package:e_cloth/features/profile/presentation/pages/transaction_detail.dart';
import 'package:e_cloth/features/profile/presentation/widget/transaction_card.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TrasactionListPage extends StatefulWidget {
  final String status;

  const TrasactionListPage({super.key, required this.status});

  @override
  State<TrasactionListPage> createState() => _TrasactionListPageState();
}

class _TrasactionListPageState extends State<TrasactionListPage> {
  String? selectedProduct;
  String? selectedDate;
  String? selectedPrice;

  final List<Map<String, dynamic>> transactions = [
    {
      'date': '10 April 2024',
      'status': 'On going',
      'imageWidget':
          Assets.images.longSleeveSquareFlannelShirt.image(fit: BoxFit.cover),
      'category': 'Women',
      'title': 'Long Sleeve Square Flannel Shirt',
      'price': 300000,
      'quantity': 1,
      'variant': 'M',
    },
    {
      'date': '5 April 2024',
      'status': 'On going',
      'imageWidget':
          Assets.images.softBrushedLongSleeveShirt.image(fit: BoxFit.cover),
      'category': 'Women',
      'title': 'Soft Brushed Long Sleeve Shirt',
      'price': 350000,
      'quantity': 2,
      'variant': 'M, S',
    },
    {
      'date': '10 April 2024',
      'status': 'Finished',
      'imageWidget':
          Assets.images.longSleeveSquareFlannelShirt.image(fit: BoxFit.cover),
      'category': 'Women',
      'title': 'Long Sleeve Square Flannel Shirt',
      'price': 300000,
      'quantity': 1,
      'variant': 'M',
    },
    {
      'date': '5 April 2024',
      'status': 'Finished',
      'imageWidget':
          Assets.images.softBrushedLongSleeveShirt.image(fit: BoxFit.cover),
      'category': 'Women',
      'title': 'Soft Brushed Long Sleeve Shirt',
      'price': 350000,
      'quantity': 2,
      'variant': 'M, S',
    },
    {
      'date': '10 April 2024',
      'status': 'Finished',
      'imageWidget': Assets.images.rayonSkipperCollar34SleeveBlouse
          .image(fit: BoxFit.cover),
      'category': 'Women',
      'title': 'Rayon Skipper Collar 3/4 Sleeve Blouse',
      'price': 400000,
      'quantity': 1,
      'variant': 'L',
    },
    {
      'date': '5 April 2024',
      'status': 'Finished',
      'imageWidget': Assets.images.rayonPintuckPulloverLongSleeveBlouse
          .image(fit: BoxFit.cover),
      'category': 'Women',
      'title': 'Rayon Pintuck Pullover Long Sleeve Blouse',
      'price': 400000,
      'quantity': 3,
      'variant': 'M, L, XL',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(
                    top: 40.0, bottom: 20, left: 5, right: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: Assets.icons.back.image(fit: BoxFit.cover),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: MySearchField(
                        hint: 'Search Transaction',
                        onChanged: (value) {},
                        onSubmitted: (value) {},
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    IconButton(
                      icon: Assets.icons.cart.image(fit: BoxFit.cover),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Filter",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MyDropdown(
                      hint: 'Product',
                      hintColor: Colors.white,
                      backgroundColor: Colors.grey,
                      borderColor: Colors.transparent,
                      value: selectedProduct,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProduct = newValue;
                        });
                      },
                      items: const ['Option 1', 'Option 2', 'Option 3'],
                    ),
                    MyDropdown(
                      hint: 'Date',
                      hintColor: Colors.white,
                      backgroundColor: Colors.grey,
                      borderColor: Colors.transparent,
                      value: selectedDate,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDate = newValue;
                        });
                      },
                      items: const ['Option 1', 'Option 2', 'Option 3'],
                    ),
                    MyDropdown(
                      hint: 'Price',
                      hintColor: Colors.white,
                      backgroundColor: Colors.grey,
                      borderColor: Colors.transparent,
                      value: selectedPrice,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPrice = newValue;
                        });
                      },
                      items: const ['Option 1', 'Option 2', 'Option 3'],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];

                    if (transaction['status'] == widget.status) {
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransactionDetail(
                                    isPurchaseOngoing:
                                        transaction['status'] == 'On going',
                                  )),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TransactionCard(
                            date: transaction['date'],
                            status: transaction['status'],
                            imageWidget: transaction['imageWidget'],
                            category: transaction['category'],
                            title: transaction['title'],
                            price: transaction['price'],
                            quantity: transaction['quantity'],
                            variant: transaction['variant'],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
