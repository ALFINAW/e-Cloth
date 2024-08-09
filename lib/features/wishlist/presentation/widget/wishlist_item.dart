import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:e_cloth/features/auth/presentation/widget/button.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class WishlistItem extends StatefulWidget {
  final Widget imageWidget;
  final String title;
  final int price;

  const WishlistItem({
    super.key,
    required this.imageWidget,
    required this.title,
    required this.price,
  });

  @override
  State<WishlistItem> createState() => _WishlistItemState();
}

class _WishlistItemState extends State<WishlistItem> {
  bool _isFavorite = true;
  final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp. ',
    decimalDigits: 0,
  );

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: SizedBox(
                  height: 130,
                  width: 120,
                  child: widget.imageWidget,
                ),
              ),
              Positioned(
                top: 6,
                right: 8,
                child: GestureDetector(
                  onTap: _toggleFavorite,
                  child: _isFavorite
                      ? SvgPicture.asset(
                          'assets/icons/like_filed.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        )
                      : Assets.icons.likeBorder.image(fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: SizedBox(
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.close,
                          size: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currencyFormatter.format(widget.price),
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyButton(
                          label: 'Add to Chart',
                          width: 130,
                          height: 35,
                          fontSize: 12,
                          buttonColor: AppColors.premierOne,
                          fontWeight: FontWeight.normal,
                          onPressed: () {})
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
