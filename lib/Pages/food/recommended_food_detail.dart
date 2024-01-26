import 'package:flutter/material.dart';
import 'package:returant_flutter/utils/colors.dart';
import 'package:returant_flutter/utils/dimensions.dart';
import 'package:returant_flutter/widgets/big_text.dart';
import 'package:returant_flutter/widgets/exandable_text_widget.dart';

import '../../widgets/app_icon.dart';

class RecommenedfoodDtetail extends StatelessWidget {
  const RecommenedfoodDtetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          toolbarHeight: 90,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AppIcon(icon: Icons.clear),
            AppIcon(icon: Icons.shopping_cart_outlined),
          ]),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Container(
              child: Center(
                  child:
                      BigText(size: Dimensions.font26, text: 'Silver App Bar')),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 5, bottom: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                ),
              ),
            ),
          ),
          pinned: true,
          backgroundColor: AppColors.yelloowColor,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/image/download (3).jfif',
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: ExpandableTextWidget(
                    text:
                        "There’s lots of info out there on how to cook rice — perhaps because it's such a simple and inexpensive staple. But the back of the rice package says one thing about how to cook it, and your favorite blog says something else. Good news — you've landed on our tried-and-tested guide. We'll walk you through all the different ways to make different varieties of rice, and ensure it never comes out mushy, gummy, or burnt. Looking to cook brown rice specifically? Check out our story There’s lots of info out there on how to cook rice — perhaps because it's such a simple and inexpensive staple. But the back of the rice package says one thing about how to cook it, and your favorite blog says something else. Good news — you've landed on our tried-and-tested guide. We'll walk you through all the different ways to make different varieties of rice, and ensure it never comes out mushy, gummy, or burnt. Looking to cook brown rice specifically? Check out our story There’s lots of info out there on how to cook rice — perhaps because it's such a simple and inexpensive staple. But the back of the rice package says one thing about how to cook it, and your favorite blog says something else. Good news — you've landed on our tried-and-tested guide. We'll walk you through all the different ways to make different varieties of rice, and ensure it never comes out mushy, gummy, or burnt. Looking to cook brown rice specifically? Check out our story There’s lots of info out there on how to cook rice — perhaps because it's such a simple and inexpensive staple. But the back of the rice package says one thing about how to cook it, and your favorite blog says something else. Good news — you've landed on our tried-and-tested guide. We'll walk you through all the different ways to make different varieties of rice, and ensure it never comes out mushy, gummy, or burnt. Looking to cook brown rice specifically? Check out our story There’s lots of info out there on how to cook rice — perhaps because it's such a simple and inexpensive staple. But the back of the rice package says one thing about how to cook it, and your favorite blog says something else. Good news — you've landed on our tried-and-tested guide. We'll walk you through all the different ways to make different varieties of rice, and ensure it never comes out mushy, gummy, or burnt. Looking to cook brown rice specifically? Check out our story There’s lots of info out there on how to cook rice — perhaps because it's such a simple and inexpensive staple. But the back of the rice package says one thing about how to cook it, and your favorite blog says something else. Good news — you've landed on our tried-and-tested guide. We'll walk you through all the different ways to make different varieties of rice, and ensure it never comes out mushy, gummy, or burnt. Looking to cook brown rice specifically? Check out our story "),
              ),
            ],
          ),
        )
      ]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20 * 2.5,
                vertical: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove,
                ),
                BigText(
                  text: '\$12.880 ' + ' X ' + ' 0',
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height20 - 4,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    child: BigText(
                      text: '\$10 | Add to cart',
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
