import 'package:e_cloth/features/home/data/models/product_model.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

final List<Product> todaySaleProduct = [
  Product(
    imageWidget:
        Assets.images.longSleeveSquareFlannelShirt.image(fit: BoxFit.fill),
    title: 'Long Sleeve Square Flannel Shirt',
    category: 'Women',
    price: 'Rp. 300.000',
    discountedPrice: 'Rp. 200.000',
    isFavorite: true,
  ),
  Product(
    imageWidget: Assets.images.longSleeveFlannelShirt.image(fit: BoxFit.fill),
    title: 'Long Sleeve Flannel Shirt',
    category: 'Women',
    price: 'Rp. 300.000',
    discountedPrice: 'Rp. 200.000',
  ),
];

final List<Product> popularProduct = [
  Product(
    imageWidget:
        Assets.images.longSleeveSquareFlannelShirt.image(fit: BoxFit.fill),
    title: 'Long Sleeve Square Flannel Shirt',
    category: 'Women',
    price: 'Rp. 300.000',
    isFavorite: true,
  ),
  Product(
    imageWidget: Assets.images.longSleeveFlannelShirt.image(fit: BoxFit.fill),
    title: 'Long Sleeve Flannel Shirt',
    category: 'Women',
    price: 'Rp. 300.000',
  ),
  Product(
    imageWidget:
        Assets.images.joggerPantsUltraStretchDRYEX.image(fit: BoxFit.fill),
    title: 'Jogger pants Ultra Stretch DRY-EX',
    category: 'Man',
    price: 'Rp. 150.000',
    isFavorite: true,
  ),
  Product(
    imageWidget:
        Assets.images.taperedPantsUltraStretchDRYEX.image(fit: BoxFit.fill),
    title: 'Tapered Pants Ultra Stretch DRY-EX',
    category: 'Man',
    price: 'Rp. 250.000',
  ),
];
