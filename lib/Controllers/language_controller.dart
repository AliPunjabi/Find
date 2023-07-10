// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  

  void switchLanguage(var param1, var param2) {
    var locate = Locale(param1, param2);
    Get.updateLocale(locate);
    update();
  }
}
