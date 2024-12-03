import 'package:e_commerce_shop/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  final String cardTitle;
  final String value;
  final Color? color;

  const OrderCardWidget({
    super.key,
    required this.cardTitle,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cardTitle,
              textAlign: TextAlign.center,
              style: AppStyles.styleMedium16(color: color),
            ),
            Text(
              value,
              textAlign: TextAlign.center,
              style: AppStyles.styleMedium16(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
