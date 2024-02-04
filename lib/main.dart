import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Pages/cart/cart_page.dart';
import '../Pages/home/food_page_body.dart';
import '../Pages/home/main_food_page.dart';
import '../Pages/splash/splash_page.dart';
import '../controllers/cart_contoller.dart';
import '../controllers/recommended_product_controller.dart';
import '../routes/route_helper.dart';
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
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: SplashScreen(),
          initialRoute: RouteHeloer.getSplashPage(),
          getPages: RouteHeloer.routes,
        );
      });
    });
  }
}
