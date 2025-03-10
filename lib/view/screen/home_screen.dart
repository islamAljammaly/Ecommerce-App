import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:new_eqommerce/controller/home_controller.dart';
import 'package:new_eqommerce/view/widgets/custom_button_home_screen.dart';

import '../../controller/home_screen_controller.dart';
import '../widgets/home/list_generate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 5, 56, 98),
                  onPressed: () {},
                  child: const Icon(Icons.shopping_basket_outlined)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: controller.listPages.elementAt(controller.currentPage),
            ));
  }
}