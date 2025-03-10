import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_eqommerce/data/datasource/remote/forget_password/reset_password.dart';

import '../../../core/class/status_request.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handling_data.dart';

abstract class ForgetPasswordController extends GetxController {
  sentResetPassword(); 
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  
  ResetPasswordData resetPasswordData  = ResetPasswordData(Get.find()) ; 

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  
  StatusRequest? statusRequest ; 

  late TextEditingController email;

  @override
  sentResetPassword() async  {
    if (formstate.currentState!.validate()){
       statusRequest = StatusRequest.loading; 
      update() ; 
      var response = await resetPasswordData.postdata(email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verfiyCode , arguments: {
            "email" : email.text
          });
        }
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Email Not Found or its invalid"); 
          statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

 
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}