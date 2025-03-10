import 'package:get/get.dart';
import 'package:new_eqommerce/data/model/catagories_model.dart';

abstract class ItemsController extends GetxController {
initialData();
}

class ItemsControllerImp extends ItemsController {
  CategoriesModel? categoriesModel;
  @override
  initialData() {
    categoriesModel = Get.arguments['categoryModel'];
  }
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

}