import 'dart:convert';
import 'dart:ui';

import 'package:e_commerce_shop/features/orders/data/models/order.dart';
import 'package:e_commerce_shop/features/orders/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<Order> orders = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String response = await rootBundle.loadString('assets/json/orders.json');
  var data = await json.decode(response);
  List l = data["orders"];
  orders = l.map((e) => Order.fromJson(e)).toList();
  for (var element in orders) {
    element.price = element.price.replaceAll(RegExp(r'[\$,]'), '');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'E-commerce Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
