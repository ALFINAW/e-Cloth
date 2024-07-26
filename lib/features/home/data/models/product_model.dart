import 'package:flutter/material.dart';

class Product {
  final Widget imageWidget;
  final String title;
  final String category;
  final String price;
  final String discountedPrice;
  final bool isFavorite;

  Product({
    required this.imageWidget,
    required this.title,
    required this.category,
    required this.price,
    required this.discountedPrice,
    this.isFavorite = false,
  });
}
