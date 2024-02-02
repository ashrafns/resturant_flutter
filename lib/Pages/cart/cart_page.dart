import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:returant_flutter/Pages/home/main_food_page.dart';
import 'package:returant_flutter/controllers/cart_contoller.dart';
import 'package:returant_flutter/controllers/popular_product_controller.dart';
import 'package:returant_flutter/controllers/recommended_product_controller.dart';
import 'package:returant_flutter/utils/app_constants.dart';
import 'package:returant_flutter/utils/colors.dart';
import 'package:returant_flutter/utils/dimensions.dart';
import 'package:returant_flutter/widgets/app_icon.dart';
import 'package:returant_flutter/widgets/big_text.dart';
import 'package:returant_flutter/widgets/small_text.dart';
import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: Dimensions.height20 * 3,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHeloer.getInitial());
                },
                child: AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize16,
                ),
              ),
              SizedBox(
                width: Dimensions.width20 * 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHeloer.getInitial());
                },
                child: AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize16,
                ),
              ),
              AppIcon(
                icon: Icons.shopping_cart,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize16,
              )
            ],
          ),
        ),
        Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              child: MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                child: GetBuilder<CartController>(builder: (CartController) {
                  var _cartList = CartController.getItems;
                  return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 100,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(bottom: Dimensions.height10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  var popularIndex =
                                      Get.find<PopularProductController>()
                                          .popularProductList
                                          .indexOf(_cartList[index].product);
                                  if (popularIndex >= 0) {
                                    Get.toNamed(RouteHeloer.getPopularFood(
                                        popularIndex, "cartpage"));
                                  } else {
                                    var recommendedIndex =
                                        Get.find<RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(_cartList[index].product);
                                    Get.toNamed(RouteHeloer.getRecommendedFood(
                                        recommendedIndex, 'cartpage'));
                                  }
                                },
                                child: Container(
                                  width: Dimensions.width20 * 5,
                                  height: Dimensions.height20 * 5,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD_URL +
                                                  CartController
                                                      .getItems[index].img!)),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                height: Dimensions.height20 * 5,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.height10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: CartController
                                            .getItems[index].name!,
                                        color: Colors.black45,
                                      ),
                                      SmallText(text: 'spicy'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: CartController
                                                .getItems[index]!.price
                                                .toString(),
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: Dimensions.height10,
                                              horizontal: Dimensions.width10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      CartController.addItem(
                                                          _cartList[index]
                                                              .product!,
                                                          -1);
                                                    },
                                                    child: Icon(Icons.remove,
                                                        color: AppColors
                                                            .signColor)),
                                                SizedBox(
                                                    width:
                                                        Dimensions.width10 / 1),
                                                BigText(
                                                    text: _cartList[index]
                                                        .quantity
                                                        .toString()),
                                                SizedBox(
                                                    width:
                                                        Dimensions.width10 / 1),
                                                GestureDetector(
                                                    onTap: () {
                                                      CartController.addItem(
                                                          _cartList[index]
                                                              .product!,
                                                          1);
                                                    },
                                                    child: Icon(Icons.add,
                                                        color: AppColors
                                                            .signColor)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                        );
                      });
                }),
              ),
            ))
      ]),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (CartController) {
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20,
          ),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  SizedBox(width: Dimensions.width10 / 1),
                  BigText(text: '\$ ' + CartController.totalAmount.toString()),
                  SizedBox(width: Dimensions.width10 / 1),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // PopularProduct.addItem(product);
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height20 - 4,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: BigText(
                  text: '  Check out  ',
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
              ),
            )
          ]),
        );
      }),
    );
  }
}
