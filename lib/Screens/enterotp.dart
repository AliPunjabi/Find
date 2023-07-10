// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:find/globals.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterOtp extends StatefulWidget {
  final String phoneNumber;

  EnterOtp({required this.phoneNumber});

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  Timer? _timer;
  int _start = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Globals.headingTextColor), // Choose color as per your need
          onPressed: () {
            Get.back(); // This line is using GetX for navigation. Replace it with your navigation code if not using GetX
          },
        ),
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
                    'assets/otplogo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                'We Texted You',
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
                    fontFamily: 'Roboto',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Enter the code that we sent you on +966${widget.phoneNumber} '),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  '00:${NumberFormat("00").format(_start)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Globals.dullTextColor,
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              Text(
                'Phone',
                style: TextStyle(
                  color: Globals.headingTextColor,
                  fontSize: 18.0,
                  fontFamily: 'HeadingNow',
                ),
              ),
              SizedBox(height: 10.0),
              PinCodeTextField(
                textStyle: TextStyle(
                  fontFamily: 'Roboto'
                ),
                length: 4, // number of digits in the OTP
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // handle the value as per your needs
                },
                appContext: context,
                autoFocus: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape
                      .box, 
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 80,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeColor: Globals.dullTextColor,
                  inactiveColor: Globals.dullTextColor,
                  selectedFillColor: Colors.white,
                  selectedColor: Globals.dullTextColor,
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
                    onTap: () {},
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Text(
                          'CONTINUE',
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
