import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_eqommerce/controller/test_controller.dart';

import '../core/class/status_request.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    final TestController controller = Get.put(TestController());

    return Scaffold(
      body: Center(
        child: Obx(() {
          if (controller.statusRequest.value == StatusRequest.loading) {
            return CircularProgressIndicator();
          } else if (controller.statusRequest.value == StatusRequest.failure) {
            return Text('Failed to load data');
          } else if (controller.data.isEmpty) {
            return Text('No data available');
          } else {
            // Display the facts joined by newlines
            return Text(controller.data.join('\n'));
          }
        }),
      ),
    );
  }
}
