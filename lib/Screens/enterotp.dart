// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:find/globals.dart';

class EnterOtp extends StatelessWidget {
  final String phoneNumber;

  EnterOtp({required this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    fontFamily: 'HeadingNow',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Enter the code that we sent you on ""$phoneNumber"" '),
                    TextSpan(
                      text: 'Find',
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Phone',
                style: TextStyle(
                  color: Globals.headingTextColor,
                  fontSize: 18.0,
                  fontFamily: 'HeadingNow',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Globals.dullTextColor, width: 1.0),
                  ),
                  prefixText: '+966',
                  prefixStyle: TextStyle(
                    color: Globals.headingTextColor,
                    fontFamily: 'HeadingNow',
                  ), // if you want to label your text field
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
