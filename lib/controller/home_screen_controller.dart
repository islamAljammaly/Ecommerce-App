import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_eqommerce/view/screen/home.dart';

import '../view/test.dart';

abstract class HomeScreenController extends GetxController {

}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> listPages = [
    const HomePage(),
    const Text('favorite'),
    const Text('Profile'),
    const Text('Settings'),
  ];

   List  titlebottomappbar = [
    "home" , 
    "favorite",
    "profile" , 
    "settings" ,
  ] ; 

  List iconsbottomappbar = [
    Icons.home,
    Icons.favorite,
    Icons.person,
    Icons.settings
  ];

  changePage(int i) {
    currentPage = i;
    update();
  }
}