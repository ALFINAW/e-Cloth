import 'package:e_cloth/core/constants/app_colors.dart';
import 'package:e_cloth/features/auth/presentation/widget/button.dart';
import 'package:e_cloth/features/auth/presentation/widget/text_field.dart';
import 'package:e_cloth/features/profile/presentation/widget/item_detail.dart';
import 'package:e_cloth/features/profile/presentation/widget/packet_tracking.dart';
import 'package:e_cloth/features/profile/presentation/widget/transaction_card.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TransactionDetail extends StatefulWidget {
  final bool isPurchaseOngoing;

  const TransactionDetail({super.key, required this.isPurchaseOngoing});

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 10),
        child: AppBar(
          title: const Text('Order Details'),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isPurchaseOngoing) const PacketTracking(),
            const SizedBox(height: 20.0),
            const ItemDetail(
              title: "Information Details",
              keyValuePairs: [
                {'key': 'Invoice', 'value': 'INV/20230928/CLOTH/12345'},
                {'key': 'Purchase date', 'value': '10 April 2024'},
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Product Details',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15.0),
            TransactionCard(
              date: "",
              status: "",
              imageWidget: Assets.images.longSleeveSquareFlannelShirt
                  .image(fit: BoxFit.cover),
              category: "Women",
              title: "Long Sleeve Square Flannel Shirt",
              price: 300000,
              quantity: 1,
              variant: "M",
              showHeader: false,
            ),
            const SizedBox(height: 10.0),
            const ItemDetail(
              title: "Delivery Details",
              keyValuePairs: [
                {'key': 'Receipt', 'value': 'INV/20230928/CLOTH/12345'},
                {'key': 'Courier', 'value': 'JNE - Reguler'},
                {
                  'key': 'Address',
                  'value':
                      'Jawa Tengah, Banjarnegara, Banjarnegara, Parakancanggah, RT06/RW09, no. 69, depan alfamart persis'
                },
              ],
            ),
            const SizedBox(height: 20.0),
            const ItemDetail(
              title: "Payment Details",
              keyValuePairs: [
                {'key': 'Payment Methods', 'value': 'Gopay'},
                {'key': 'Price of Goods', 'value': 'Rp. 300.000'},
                {'key': 'Shipping Price', 'value': 'Rp. 17.000'},
              ],
              showCopyIcon: false,
            ),
            const SizedBox(height: 10.0),
            const Divider(),
            const SizedBox(height: 20.0),
            const ItemDetail(
              title: "Total",
              keyValuePairs: [
                {
                  'key': 'Amount of Expenditure',
                  'value': 'Rp. 317.000',
                  'color': AppColors.premierOne,
                },
              ],
              showCopyIcon: false,
            ),
            const SizedBox(height: 20.0),
            if (widget.isPurchaseOngoing)
              MyButton(
                label: 'Order Received',
                labelColor: AppColors.secondaryOne,
                onPressed: () {},
                buttonColor: Colors.transparent,
                borderColor: Colors.grey,
                borderWidth: 1,
              )
            else ...[
              const Text(
                "Notes",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15.0),
              MyTextField(
                value: null,
                hint: '',
                onChanged: (value) {},
                maxLines: 5,
                borderColor: Colors.black,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
