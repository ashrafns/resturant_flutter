import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:returant_flutter/utils/app_constants.dart';
import 'package:returant_flutter/utils/dimensions.dart';
import 'package:returant_flutter/widgets/big_text.dart';
import 'package:returant_flutter/widgets/small_text.dart';

import '../../controllers/cart_contoller.dart';
import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (Value) => ++Value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();
    var listCounter = 0;

    return Scaffold(
      body: Column(children: [
        Container(
          height: Dimensions.height20 * 5,
          width: double.maxFinite,
          padding: EdgeInsets.only(top: Dimensions.height45),
          color: AppColors.mainColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(
                text: 'Cart History',
                color: Colors.white,
              ),
              AppIcon(
                icon: Icons.shopping_cart_outlined,
                iconColor: AppColors.mainColor,
                backgroundColor: AppColors.yelloowColor,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(Dimensions.height20),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: [
                  for (int i = 0; i < itemsPerOrder.length; i++)
                    Container(
                      height: Dimensions.height45 * 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (() {
                            DateTime parseDate =
                                DateFormat("yyyy-MM-dd hh:mm:ss").parse(
                                    getCartHistoryList[listCounter].time!);
                            var inputDate =
                                DateTime.parse(parseDate.toString());
                            var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
                            var outputDate = outputFormat.format(inputDate);
                            return BigText(text: outputDate);
                          }()),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children:
                                    List.generate(itemsPerOrder[i], (index) {
                                  if (listCounter < getCartHistoryList.length) {
                                    listCounter++;
                                  }
                                  return index <= 2
                                      ? Container(
                                          height: Dimensions.height20 * 4,
                                          width: Dimensions.height20 * 4,
                                          margin: EdgeInsets.only(
                                              right: Dimensions.width10 / 2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius15 / 2),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                AppConstants.BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    getCartHistoryList[
                                                            listCounter - 1]
                                                        .img!,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container();
                                }),
                              ),
                              Container(
                                height: Dimensions.height20 * 4,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SmallText(
                                      text: "Total",
                                      color: AppColors.titleColor,
                                    ),
                                    BigText(
                                      text:
                                          itemsPerOrder[i].toString() + 'items',
                                      color: AppColors.titleColor,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width10,
                                        vertical: Dimensions.height10 / 2,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15 / 3),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.mainColor),
                                      ),
                                      child: SmallText(
                                        text: 'one more',
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20),
                    ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}