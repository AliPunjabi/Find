// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:find/Controllers/language_controller.dart';
import 'package:find/Models/categModel.dart';
import 'package:find/Screens/categories.dart';
import 'package:find/Screens/enterotp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find/globals.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EnterPhoneScreen extends StatefulWidget {
  @override
  _EnterPhoneScreenState createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  final TextEditingController phoneController = TextEditingController();
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              // Switch language when flag is tapped
              String currentLocale = Get.locale!.languageCode;
              if (currentLocale == 'en') {
                languageController.switchLanguage('ar', 'ae');
              } else {
                languageController.switchLanguage('en', 'US');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                  'assets/flag.png'), // Update with the path of your asset
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  width: 100.0, // You can adjust this as needed
                  height: 100.0, // You can adjust this as needed
                  child: Image.asset(
                    'assets/phonelogo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                "welcome".tr,
                style: TextStyle(
                  color: Globals.headingTextColor,
                  fontSize: 24.0,
                  fontFamily: 'HeadingNow',
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Globals.dullTextColor,
                    fontSize: 13.0,
                    fontFamily: 'HeadingNow',
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'enter_phone'.tr),
                    TextSpan(
                      text: 'Find',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Globals.headingTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'phone'.tr,
                style: TextStyle(
                  color: Globals.headingTextColor,
                  fontSize: 18.0,
                  fontFamily: 'HeadingNow',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                style: TextStyle(
                  fontFamily: 'Roboto',
                ),
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Globals.dullTextColor, width: 1.0),
                  ),
                  prefixText: '+966 ',
                  prefixStyle: TextStyle(
                    fontSize: 16,
                    color: Globals.headingTextColor,
                    fontFamily: 'Roboto',
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Globals.dullTextColor, width: 1.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 400,
                height: 50.0,
                // margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: Globals.buttonGradient,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      String phoneNumber = phoneController.text.trim();

                      if (phoneNumber.isNotEmpty) {
                        try {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '+92$phoneNumber',
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                String verification = verificationId;
                                Get.to(
                                    () => EnterOtp(
                                        phoneNumber: phoneNumber,
                                        verify: verification),
                                    transition: Transition.fadeIn,
                                    duration: Duration(seconds: 2));
                                // Get.to(
                                //   () => CategoriesScreen(),
                                //   transition: Transition.fadeIn,
                                //      duration: Duration(seconds: 2));
                                
                              }
                          );
                        }
                         catch (e) {
                          Get.snackbar('Error', 'Fail.');
                        }
                      } else {
                        Get.snackbar(
                            'Error', 'Please enter your phone number.');
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Text(
                          'continue'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        Positioned(
                          right: 8,
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
