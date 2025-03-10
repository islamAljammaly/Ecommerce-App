
import 'package:get/get.dart';
import 'package:new_eqommerce/core/constant/routes.dart';
import 'package:new_eqommerce/data/model/catagories_model.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/home.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goItemsPage(CategoriesModel itemSelected);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;

  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List categories = [];
  List items = [];
  // List items = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
getdata() async {
  statusRequest = StatusRequest.loading;
  update();

  var response = await homedata.getData();
  print("=============================== Controller $response ");

  statusRequest = handlingData(response);

  if (StatusRequest.success == statusRequest) {
    // Extract the Right side of the Either to access the Map
    response.fold(
      (l) {
        statusRequest = StatusRequest.failure; // Handle Left side (failure case)
      },
      (r) {
        // Handle Right side (success case)
        if (r['status'] == "success") {
          categories = r['categories'];
          items = r['items'];
        } else {
          statusRequest = StatusRequest.failure;
        }
      },
    );
  }

  update();
}

  @override
  goItemsPage(CategoriesModel itemSelected) {
    Get.toNamed(AppRoute.itemspage,arguments:{'categoryModel' : itemSelected});
  }

}