import 'package:e_commerce_shop/features/orders/presentation/views/widgets/back_btn_widget.dart';
import 'package:e_commerce_shop/features/orders/presentation/views/widgets/scrollable_bar_chart.dart';

import 'package:e_commerce_shop/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrdersGraphView extends StatefulWidget {
  const OrdersGraphView({super.key});

  @override
  State<OrdersGraphView> createState() => _OrdersGraphViewState();
}

class _OrdersGraphViewState extends State<OrdersGraphView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomBackBtn(),
            Expanded(
              child: Container(
                // width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(35.0),
                    topEnd: Radius.circular(35.0),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Orders Graph",
                      style: AppStyles.styleMedium18(
                        color: const Color.fromARGB(255, 64, 147, 116),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // const AspectRatio(
                    //   aspectRatio: 0.8,
                    //   child:
                    ScrollableBarChart(),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
