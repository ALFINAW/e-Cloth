import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:e_cloth/features/auth/presentation/widget/button.dart';
import 'package:e_cloth/features/home/presentation/pages/payment_page.dart';
import 'package:e_cloth/features/home/presentation/widget/cart_item.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _selectAll = false;
  double _totalPrice = 0.0;
  int _selectedItemCount = 0;
  bool _isAnyItemSelected = false;

  final NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);

  final List<CartItemData> _cartItems = [
    CartItemData(
      image: Assets.images.longSleeveFlannelShirtGreen.image(fit: BoxFit.cover),
      category: 'Men',
      title: 'Long Sleeve Flannel Shirt',
      price: 600000,
      size: 'M',
    ),
    CartItemData(
      image: Assets.images.ultralightLightDownJacket.image(fit: BoxFit.cover),
      category: 'Women',
      title: 'Ultralight Light Down Jacket',
      price: 690000,
      size: 'M',
    ),
  ];

  void _updateTotalPrice() {
    setState(() {
      _totalPrice = _cartItems.fold(0, (sum, item) {
        return item.isSelected ? sum + (item.price * item.quantity) : sum;
      });
    });
  }

  void _selectAllItems(bool isSelected) {
    setState(() {
      _selectAll = isSelected;
      _selectedItemCount = 0;
      _isAnyItemSelected = false;
      for (var item in _cartItems) {
        item.isSelected = isSelected;
        if (isSelected) {
          _selectedItemCount++;
        }
      }
      _updateTotalPrice();
      _isAnyItemSelected = _selectedItemCount > 0;
    });
  }

  void _updateItemSelection(int index, bool isSelected) {
    setState(() {
      _cartItems[index].isSelected = isSelected;
      if (isSelected) {
        _selectedItemCount++;
      } else {
        _selectedItemCount--;
      }
      _updateTotalPrice();
      _isAnyItemSelected = _selectedItemCount > 0;
    });
  }

  void _updateItemQuantity(int index, int newQuantity) {
    setState(() {
      _cartItems[index].quantity = newQuantity;
      _updateTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 50),
          child: AppBar(
            title: const Text('Cart'),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _selectAll,
                          onChanged: (bool? value) {
                            if (value != null) {
                              _selectAllItems(value);
                            }
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
                        Text(
                          _selectedItemCount > 0
                              ? '$_selectedItemCount selected items'
                              : 'Select all items',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Assets.icons.trash.image(
                            fit: BoxFit.cover,
                            color:
                                _isAnyItemSelected ? Colors.black : Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
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
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10.0, right: 20, bottom: 80),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  for (int i = 0; i < _cartItems.length; i++)
                    CartItem(
                      imageWidget: _cartItems[i].image,
                      category: _cartItems[i].category,
                      title: _cartItems[i].title,
                      price: _cartItems[i].price,
                      size: _cartItems[i].size,
                      isSelected: _cartItems[i].isSelected,
                      quantity: _cartItems[i].quantity,
                      onSelectionChanged: (isSelected) {
                        _updateItemSelection(i, isSelected);
                      },
                      onQuantityChanged: (newQuantity) {
                        _updateItemQuantity(i, newQuantity);
                      },
                      currencyFormatter: currencyFormatter,
                    ),
                ],
              ),
            ),
            if (_totalPrice > 0)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            currencyFormatter.format(_totalPrice),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.premierOne,
                            ),
                          ),
                        ],
                      ),
                      MyButton(
                          label: 'Checkout',
                          width: 160,
                          buttonColor: AppColors.premierOne,
                          onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentPage()),
                                )
                              })
                    ],
                  ),
                ),
              ),
          ],
        ));
  }
}

class CartItemData {
  final Widget image;
  final String category;
  final String title;
  final double price;
  final String size;
  int quantity;
  bool isSelected;

  CartItemData({
    required this.image,
    required this.category,
    required this.title,
    required this.price,
    required this.size,
    this.quantity = 1,
    this.isSelected = false,
  });
}
