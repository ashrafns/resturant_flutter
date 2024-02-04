import 'package:get/get.dart';
import 'package:returant_flutter/controllers/cart_contoller.dart';
import 'package:returant_flutter/controllers/popular_product_controller.dart';
import 'package:returant_flutter/controllers/recommended_product_controller.dart';
import 'package:returant_flutter/data/api/aoi_client.dart';
import 'package:returant_flutter/data/repository/cart_repo.dart';
import 'package:returant_flutter/data/repository/poular_product_repo.dart';
import 'package:returant_flutter/data/repository/recommended_product_repo.dart';
import 'package:returant_flutter/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));

//controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
