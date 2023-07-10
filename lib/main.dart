// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:find/Controllers/language_controller.dart';
import 'package:find/Screens/enterphone.dart';
import 'package:find/localization/app_translations.dart';
import 'package:find/localization/localization_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      
            theme: ThemeData(
              fontFamily: 'HeadingNow',
            ),
            home: EnterPhoneScreen(),
          );
        
  }
}
