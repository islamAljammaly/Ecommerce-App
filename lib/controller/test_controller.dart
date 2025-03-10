import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/test.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  
  var data = <dynamic>[].obs; // Use RxList for reactivity
  var statusRequest = StatusRequest.loading.obs; // Reactive statusRequest

  getData() async {
  statusRequest.value = StatusRequest.loading;

  try {
    var response = await testData.getData();
    print("=============================== Controller $response ");

    // Check if the response contains the 'fact' key
    if (response != null && response.containsKey('fact')) {
      data.add(response['fact']); // Add the fact (String) to the data list
      statusRequest.value = StatusRequest.success;
    } else {
      statusRequest.value = StatusRequest.failure; // Handle unexpected response format
    }
  } catch (e) {
    print("Error: $e");
    statusRequest.value = StatusRequest.failure; // Handle exceptions
  }
}


  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
