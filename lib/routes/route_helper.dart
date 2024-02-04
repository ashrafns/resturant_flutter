import 'package:get/get.dart';
import '../Pages/cart/cart_page.dart';
import '../Pages/food/popular_food_detail.dart';
import '../Pages/food/recommended_food_detail.dart';
import '../Pages/home/main_food_page.dart';
import '../Pages/splash/splash_page.dart';

import '../Pages/home/home_page.dart';

class RouteHeloer {
  static const String splashPage = '/splash_page';
  static const String initial = '/';
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage() => "$splashPage";
  static String getInitial() => "$initial";
  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";
  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";
  static String getCartPage() => "$cartPage";

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var page = Get.parameters['page'];
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var page = Get.parameters['page'];
          var pageId = Get.parameters['pageId'];
          return RecommenedfoodDtetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
  ];
}
