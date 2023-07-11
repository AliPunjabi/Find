// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:find/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find/Controllers/product_controller.dart';

class CategoriesScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.scaffColorText,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color:
                    Globals.headingTextColor), // Choose color as per your need
            onPressed: () {
              Get.back(); // This line is using GetX for navigation. Replace it with your navigation code if not using GetX
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'cattitle'.tr,
                    style: TextStyle(color: Globals.headingTextColor),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Globals.dullTextColor,
                        fontSize: 13.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'deliver'.tr),
                        TextSpan(
                            text: "Mohamadeah Dist. Riyadh",
                            style: TextStyle(color: Globals.highlightColorText))
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Icon(
                  Icons.search,
                  color: Globals.dullTextColor,
                ),
              )
            ],
          )),
      body: Obx(() {
        if (productController.productList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: productController.productList.length,
            itemBuilder: (ctx, i) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: AspectRatio(
                    aspectRatio:
                        1.7, // This will force image to take the square shape
                    child: ClipRRect(
                      // ClipRRect is used to give the image a rounded corner to match the card
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        productController.productList[i].image,
                        fit: BoxFit
                            .cover, // Use BoxFit.cover to ensure the image covers the space
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    productController.productList[i].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Globals.greenTextColor, // Use green color from Globals
                      fontFamily:
                          'HeadingNow', // Replace this with your font family
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:
                  1.3, // Adjust this value until you get the layout you want
            ),
          );
        }
      }),
      floatingActionButton: Container(
  padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30), // Adjust the radius to control the roundness
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.explore,
        color: Globals.headingTextColor,
      ),
      SizedBox(width: 8),
      Text(
        "around".tr,
        style: TextStyle(color: Globals.headingTextColor),
      ),
    ],
  ),
),

    );
  }
}
