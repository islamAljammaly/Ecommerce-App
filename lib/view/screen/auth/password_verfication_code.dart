import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:new_eqommerce/core/constant/routes.dart';
import 'package:new_eqommerce/view/widgets/auth/custom_button_auth.dart';

import '../../../controller/auth/forgetpassword/vefiycode_controller.dart';
import '../../widgets/auth/custom_text_body_auth.dart';
import '../../widgets/auth/custom_text_title_auth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller =
        Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffF8F9FD),
        elevation: 0.0,
        title: Text('Verification Email',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Check Email"),
          const SizedBox(height: 10),
          CustomTextBodyAuth(
              text:
                  "Please click to the link that we sent to ${controller.email} to change your password"),
          const SizedBox(height: 15),
             CustomButtomAuth(text: "Login Page", onPressed: () => Get.offAllNamed(AppRoute.login),)
        ]),
      ),
    );
  }
}