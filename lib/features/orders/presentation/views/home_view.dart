import 'package:e_commerce_shop/features/orders/presentation/views/orders_graph_view.dart';
import 'package:e_commerce_shop/features/orders/presentation/views/orders_metrics_view.dart';
import 'package:e_commerce_shop/features/orders/presentation/views/widgets/home_tile_widget.dart';
import 'package:e_commerce_shop/features/orders/presentation/views/widgets/profile_img_widget.dart';
import 'package:e_commerce_shop/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                color: const Color(0xff539F83),
                child: Center(
                  child: Text(
                    'Hello, to our Ecommerce shop',
                    style: AppStyles.styleRegular20(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Center(
                        child: Text(
                          'Aya Elshershaby',
                          style: AppStyles.styleRegular20(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      HomeTileWidget(
                        assetsName: "assets/images/pie-chart2.png",
                        title: 'Orders Metrics',
                        onTapFun: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrdersMetricsView(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      HomeTileWidget(
                        assetsName: "assets/images/growth.png",
                        title: 'Orders Chart',
                        onTapFun: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrdersGraphView(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const ProfileImgWidget(),
        ],
      ),
    );
  }
}
