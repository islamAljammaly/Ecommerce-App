import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:new_eqommerce/view/widgets/auth/custom_button_auth.dart';

import '../../../controller/auth/verifycode_signup_controller.dart';
import '../../../core/class/status_request.dart';
import '../../widgets/auth/custom_text_body_auth.dart';
import '../../widgets/auth/custom_text_title_auth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:const Color(0xffF8F9FD),
        elevation: 0.0,
        title: Text('Verification Code',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.grey)),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? const Center(
                  child: Text("Loading ...."),
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: ListView(children: [
                    const SizedBox(height: 20),
                    const CustomTextTitleAuth(text: "Check code"),
                    const SizedBox(height: 10),
                     CustomTextBodyAuth(
                        text:
                            "We sent verfication link to your email ${controller.email},\n please go to your email and click to it to be able to log in"),
                    const SizedBox(height: 15),
                    CustomButtomAuth(text: 'go to login page',onPressed: () {
                      controller.goToSuccessSignUp('');
                    },)
                  ]),
                )),
    );
  }
}