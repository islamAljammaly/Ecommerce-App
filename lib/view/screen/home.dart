import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/class/hangling_data_view.dart';
import '../widgets/home/custom_app_bar.dart';
import '../widgets/home/custom_card_home.dart';
import '../widgets/home/custom_title_home.dart';
import '../widgets/home/list_categories_home.dart';
import '../widgets/home/list_items_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      CustomAppBar(
                          titleappbar: "Find Product",
                          onPressedIcon: () {},
                          onPressedSearch: () {}),
                      const CustomCardHome(
                          title: "A summer surprise", body: "Cashback 20%"),
                      const ListCategoriesHome(),
                      const SizedBox(height: 10),
                      const CustomTitleHome(title: "Product for you"),
                      const SizedBox(height: 10),
                      const ListItemsHome(), 
                      const CustomTitleHome(title: "Offer"),
                      const SizedBox(height: 10),
                      const ListItemsHome()
                    ],
                  ))),
    );
  }
}