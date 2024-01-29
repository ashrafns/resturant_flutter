import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:returant_flutter/Pages/home/food_page_body.dart';
import 'package:returant_flutter/Pages/home/main_food_page.dart';
import 'package:returant_flutter/controllers/recommended_product_controller.dart';
import 'package:returant_flutter/routes/route_helper.dart';
import 'Pages/food/recommended_food_detail.dart';
import 'controllers/popular_product_controller.dart';
import 'heloer/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainFoodPage(),
      initialRoute: RouteHeloer.initial,
      getPages: RouteHeloer.routes,
    );
  }
}
