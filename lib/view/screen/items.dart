import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';

class ItemsPage extends GetView<ItemsControllerImp> {
  const ItemsPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Center(
        child: Text('${controller.categoriesModel!.categoriesName}'),
      ),
    );
  }
}