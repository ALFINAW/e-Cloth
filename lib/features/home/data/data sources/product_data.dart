import 'package:e_cloth/features/home/data/models/product_model.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

final List<Product> products =  [
    Product(
      imageWidget: Assets.images.longSleeveSquareFlannelShirt.image(fit: BoxFit.fill),
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