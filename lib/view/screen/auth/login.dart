import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_eqommerce/core/class/hangling_data_view.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/status_request.dart';
import '../../../core/functions/alert_exit.dart';
import '../../../core/functions/validate.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_text_body_auth.dart';
import '../../widgets/auth/custom_text_form_auth.dart';
import '../../widgets/auth/custom_text_title_auth.dart';
import '../../widgets/auth/logo_auth.dart';
import '../../widgets/auth/text_signup_signin.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffF8F9FD),
        elevation: 0.0,
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) =>
                 HandlingDataView(
                  statusRequest: controller.statusRequest,
                   widget: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Form(
                            key: controller.formstate,
                            child: ListView(children: [
                              const LogoAuth(),
                              const SizedBox(height: 20),
                              CustomTextTitleAuth(text: "10".tr),
                              const SizedBox(height: 10),
                              CustomTextBodyAuth(text: "11".tr),
                              const SizedBox(height: 15),
                              CustomTextFormAuth(
                                isNumber: false,
                 
                                valid: (val) {
                                  return validate(val!, 5, 100, "email");
                                },
                                mycontroller: controller.email,
                                hinttext: "12".tr,
                                iconData: Icons.email_outlined,
                                labeltext: "18".tr,
                                // mycontroller: ,
                              ),
                              GetBuilder<LoginControllerImp>(
                                builder: (controller) => CustomTextFormAuth(
                                  obscureText: controller.isshowpassword,
                                  onTapIcon: () {
                                    controller.showPassword();
                                  },
                                  isNumber: false,
                                  valid: (val) {
                                    return validate(val!, 3, 30, "password");
                                  },
                                  mycontroller: controller.password,
                                  hinttext: "13".tr,
                                  iconData: Icons.lock_outline,
                                  labeltext: "19".tr,
                                  // mycontroller: ,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  "14".tr,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              CustomButtomAuth(
                                  text: "15".tr,
                                  onPressed: () {
                                    controller.login();
                                  }),
                              const SizedBox(height: 40),
                              CustomTextSignUpOrSignIn(
                                textone: "16".tr,
                                texttwo: "17".tr,
                                onTap: () {
                                  controller.goToSignUp();
                                },
                              )
                            ]),
                          ),
                        ),
                 ),
          )),
    );
  }
}