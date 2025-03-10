import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/forgetpassword/reset_password_controller.dart';
import '../../../core/class/status_request.dart';
import '../../../core/functions/validate.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_body_auth.dart';
import '../../widgets/auth/custom_text_form_auth.dart';
import '../../widgets/auth/custom_text_title_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffF8F9FD),
        elevation: 0.0,
        title: Text('ResetPassword',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.grey)),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? const Center(child: Text("Loading..."))
              : Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "35".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "35".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validate(val!, 3, 40, "password");
                        },
                        mycontroller: controller.password,
                        hinttext: "13".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "19".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validate(val!, 3, 40, "password");
                        },
                        mycontroller: controller.repassword,
                        hinttext: "Re" + " " + "13".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "19".tr,
                        // mycontroller: ,
                      ),
                      CustomButtomAuth(
                          text: "33".tr,
                          onPressed: () {
                            controller.goToSuccessResetPassword();
                          }),
                      const SizedBox(height: 40),
                    ]),
                  ),
                )),
    );
  }
}