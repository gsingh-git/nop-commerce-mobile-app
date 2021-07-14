import 'package:nopapp/ui/widgets/Drawerfile.dart';
import 'package:nopapp/ui/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nopapp/controllers/homecontroller.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Image.asset(
            'assets/flutter1.png',
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 4,
          ),
          actions: <Widget>[
            Icon(
              Icons.notifications,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Icon(
                Icons.shopping_cart,
                size: 20,
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: Drawerfile(),
        ),
        body: SafeArea(
          child: Obx(() {
            if (homeController.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else
              return Body(homeController.bannerImage.value);
          }),
        )
        //Body(data),
        );
  }
}
