import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartItem extends StatelessWidget {
  final Widget imageWidget;
  final String category;
  final String title;
  final double price;
  final String size;
  final bool isSelected;
  final int quantity;
  final Function(bool) onSelectionChanged;
  final Function(int) onQuantityChanged;
  final NumberFormat currencyFormatter;

  const CartItem({
    super.key,
    required this.imageWidget,
    required this.category,
    required this.title,
    required this.price,
    required this.size,
    required this.isSelected,
    required this.quantity,
    required this.onSelectionChanged,
    required this.onQuantityChanged,
    required this.currencyFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Row(
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (bool? value) {
                  if (value != null) {
                    onSelectionChanged(value);
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
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: imageWidget,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      currencyFormatter.format(price),
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.premierOne,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      size,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.6,
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 33,
                    width: 42,
                    child: IconButton(
                      icon: Assets.icons.min.image(fit: BoxFit.cover),
                      onPressed: () {
                        if (quantity > 1) {
                          onQuantityChanged(quantity - 1); // Decrease quantity
                        }
                      },
                    ),
                  ),
                   Text(
                   '$quantity',
                    style:const TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 33,
                    width: 42,
                    child: IconButton(
                      icon: Assets.icons.plus.image(fit: BoxFit.cover),
                      onPressed: () {
                        onQuantityChanged(quantity + 1); // Increase quantity
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
