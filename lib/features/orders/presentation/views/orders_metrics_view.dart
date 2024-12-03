import 'package:e_commerce_shop/features/orders/presentation/views/widgets/back_btn_widget.dart';
import 'package:e_commerce_shop/features/orders/presentation/views/widgets/indicator_widget.dart';
import 'package:e_commerce_shop/features/orders/presentation/views/widgets/order_card_widget.dart';
import 'package:e_commerce_shop/main.dart';
import 'package:e_commerce_shop/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';

class OrdersMetricsView extends StatefulWidget {
  const OrdersMetricsView({super.key});

  @override
  State<OrdersMetricsView> createState() => _OrdersMetricsViewState();
}

class _OrdersMetricsViewState extends State<OrdersMetricsView> {
  double totalCount = 0.0;
  double priceAvarage = 0.0;
  double numberOfReturns = 0;
  List<PieData> pies = [
    PieData(value: 0.15, color: Colors.yellow),
    PieData(value: 0.35, color: Colors.cyan),
    PieData(value: 0.45, color: Colors.yellow.shade400),
  ];

  @override
  void initState() {
    totalCount = orders.length.toDouble();
    double totalPrice = orders.fold(
        0.0,
        (sum, item) =>
            item.status != "RETURNED" ? sum + double.parse(item.price) : sum);
    priceAvarage = totalPrice / totalCount;
    numberOfReturns = orders
        .where((element) => element.status == "RETURNED")
        .toList()
        .length
        .toDouble();

    pies = [
      PieData(value: totalCount, color: Colors.red.shade400),
      PieData(value: priceAvarage, color: Colors.blue.shade400),
      PieData(value: numberOfReturns, color: Colors.yellow.shade400),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = (MediaQuery.of(context).size.width / 2 - 70);
    String tapIndex = "";

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const CustomBackBtn(),
              Expanded(
                child: Container(
                  width: double.infinity,
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
                        "Orders Metrics",
                        style: AppStyles.styleMedium18(
                          color: const Color.fromARGB(255, 64, 147, 116),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        primary: false,
                        shrinkWrap: true,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        childAspectRatio: cardWidth / 80,
                        crossAxisCount: 3,
                        children: <Widget>[
                          OrderCardWidget(
                            cardTitle: "Total Count",
                            value: totalCount.toStringAsFixed(0),
                            color: Colors.red.shade400,
                          ),
                          OrderCardWidget(
                            cardTitle: "Average Price",
                            value: priceAvarage.toStringAsFixed(0),
                            color: Colors.blue.shade400,
                          ),
                          OrderCardWidget(
                            cardTitle: "Total Return",
                            value: numberOfReturns.toStringAsFixed(0),
                            color: Colors.yellow.shade700,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              EasyPieChart(
                                borderWidth: 35,
                                key: const Key('pie'),
                                children: pies,
                                pieType: PieType.crust,
                                onTap: (index) {
                                  setState(() {
                                    tapIndex = index.toString();
                                  });
                                },
                                // gap: 0.1,
                                gap: 140.1,
                                start: 0,
                                animateFromEnd: true,
                                size: MediaQuery.sizeOf(context).width / 3.5,
                                style: AppStyles.styleRegular14(),
                                child: Center(child: Text(tapIndex)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Indicator(
                                    color: Colors.red.shade400,
                                    text: 'Total count',
                                    isSquare: false,
                                  ),
                                  const SizedBox(height: 4),
                                  Indicator(
                                    color: Colors.blue.shade400,
                                    text: 'Average price',
                                    isSquare: false,
                                  ),
                                  const SizedBox(height: 4),
                                  Indicator(
                                    color: Colors.yellow.shade400,
                                    text: 'Number of returns',
                                    isSquare: false,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
