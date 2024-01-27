import 'package:get/get.dart';
import 'package:returant_flutter/controllers/popular_product_controller.dart';
import 'package:returant_flutter/data/api/aoi_client.dart';
import 'package:returant_flutter/data/repository/poular_product_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.dbestech.com"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

//controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}
