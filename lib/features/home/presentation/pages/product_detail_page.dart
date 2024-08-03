import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:e_cloth/features/auth/presentation/widget/button.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Product {
  final Widget imageWidget;
  final String title;
  final String category;
  final String price;
  final int stock;
  final List<String> variant;
  final String description;

  Product(
      {required this.imageWidget,
      required this.title,
      required this.category,
      required this.price,
      required this.stock,
      required this.variant,
      required this.description});
}

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final List<Product> products = [
    Product(
        imageWidget:
            Assets.images.longSleeveFlannelShirtGreen.image(fit: BoxFit.cover),
        title: "Long Sleeve Flannel Shirt Green",
        category: "Men",
        price: "Rp. 500.000",
        stock: 200,
        variant: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        description:
            "Men's shirts are made from lightweight flannel material and are suitable for any style. Regular fit so easy to layer. Men's shirts are made from lightweight flannel material and are suitable for any style. Regular fit so easy to layer. Men's shirts are made from lightweight flannel material and are suitable for any style. Regular fit so easy to layer. Men's shirts are made from lightweight flannel material and are suitable for any style. Regular fit so easy to layer.")
  ];

  String? selectedVariant;

  @override
  Widget build(BuildContext context) {
    final product = products[0];

    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: products[0].imageWidget,
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: IconButton(
                      icon: Assets.icons.back.image(fit: BoxFit.cover),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      product.category,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      product.price,
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Stock : ${product.stock}",
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Select variant",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: product.variant.map((variant) {
                        final isSelected = selectedVariant == variant;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedVariant = variant;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5.0),
                            margin: const EdgeInsets.only(right: 15.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color:
                                    isSelected ? Colors.red : Colors.grey[900]!,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              variant,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: isSelected ? Colors.red : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: selectedVariant != null
              ? MyButton(
                  label: 'Add to Chart',
                  width: 170,
                  buttonColor: AppColors.premierOne,
                  onPressed: () => {})
              : const SizedBox.shrink(),
        )
      ],
    ));
  }
}
