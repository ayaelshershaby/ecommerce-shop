import 'package:e_commerce_shop/main.dart';
import "package:collection/collection.dart";
import 'package:e_commerce_shop/utils/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ScrollableBarChart extends StatefulWidget {
  const ScrollableBarChart({super.key});

  @override
  State<ScrollableBarChart> createState() => _ScrollableBarChartState();
}

class _ScrollableBarChartState extends State<ScrollableBarChart> {
  List<Map<String, dynamic>> orderData = [];
  int maxValue = 0;
  @override
  void initState() {
    var groupByDate = groupBy(
        orders, (entry) => DateFormat('HH:mm').format(entry.registered));

    groupByDate.forEach((k, v) {
      orderData.add(
        {'timestamp': k, 'orders': v.length},
      );
    });

    for (var e in orderData) {
      if (e["orders"] > maxValue) {
        maxValue = e["orders"];
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SizedBox(
          // width: MediaQuery.sizeOf(context).width / 3,
          height: MediaQuery.sizeOf(context).height / 1.3,
          width: orderData.length * 50.0,

          child: BarChart(
            BarChartData(
              barGroups: _buildBarGroups(),
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: AppStyles.styleRegular14(),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() < orderData.length &&
                          value.toInt() >= 0) {
                        final timestamp = orderData[value.toInt()]["timestamp"];
                        return Text(
                          timestamp,
                          style: AppStyles.styleRegular14(),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(color: Colors.grey, width: 1),
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              maxY: _calculateMaxY() + 20,
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (bar) {
                    return Colors.indigo;
                  },
                  fitInsideHorizontally: true,
                  fitInsideVertically: false, // Allows tooltip to render above
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    return BarTooltipItem(
                      '${orderData[groupIndex]["orders"]} order',
                      AppStyles.styleBold14(color: Colors.white),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateMaxY() {
    return orderData
        .map((e) => e["orders"].toDouble())
        .reduce((a, b) => a > b ? a : b);
  }

  List<BarChartGroupData> _buildBarGroups() {
    return orderData.asMap().entries.map((entry) {
      int index = entry.key;
      double orders = entry.value["orders"].toDouble();
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: orders,
            width: 12,
            borderRadius: BorderRadius.circular(4),
            color: maxValue == orders
                ? Colors.green.shade500
                : Colors.blue.shade300,
            // gradient: maxValue == orders
            //     ? LinearGradient(
            //         colors: [Colors.purple, Colors.pink, Colors.pink.shade600],
            //         begin: Alignment.bottomLeft,
            //         end: Alignment.topRight,
            //         stops: const [0.4, 0.6, 0.9],
            //         tileMode: TileMode.repeated,
            //       )
            //     : LinearGradient(colors: [
            //         Colors.indigo,
            //         Colors.indigo.withOpacity(0.8),
            //       ]),
          ),
        ],
      );
    }).toList();
  }
}
