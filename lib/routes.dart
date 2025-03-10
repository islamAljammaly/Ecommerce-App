import 'package:get/get.dart';
import 'package:new_eqommerce/view/screen/auth/password_verfication_code.dart';
import 'package:new_eqommerce/view/screen/auth/success_reset_password.dart';
import 'package:new_eqommerce/view/screen/items.dart';
import 'core/constant/routes.dart';
import 'core/middleware/my_middlewere.dart';
import 'view/screen/auth/forget_password.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/reset_password.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/success_sign_up.dart';
import 'view/screen/auth/verfication_code.dart';
import 'view/screen/home.dart';
import 'view/screen/home_screen.dart';
import 'view/screen/language.dart';
import 'view/screen/onboarding.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => TestView()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.itemspage, page: () => const ItemsPage()),
];
