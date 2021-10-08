import 'package:nopapp/ui/widgets/FeaturedBrand.dart';
import 'package:nopapp/ui/widgets/category_list.dart';
import 'package:nopapp/ui/widgets/DealsOfTheDay.dart';
import 'package:nopapp/ui/widgets/home_slider.dart';
import 'package:nopapp/ui/widgets/DualCameraPhones.dart';
import 'package:nopapp/ui/widgets/Deals.dart';
import 'package:nopapp/ui/widgets/Offers.dart';
import 'package:flutter/material.dart';
import 'package:nopapp/models/homepage_model.dart';

class Body extends StatefulWidget {
  HomePageModel? _homePageModel;

  Body(HomePageModel homeModel) {
    this._homePageModel = homeModel;
  }

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 11,
            color: Color(0xFFFDE5B4),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.search),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Search for Products, Brands and More',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CategoryList(widget._homePageModel!.categoryModel!),
          HomeSlider(widget._homePageModel!.bannerImages!),
          Thirdlist(),
          Fourthlist(),
          SizedBox(
            height: 5,
          ),
          Fifthlist(),
          Sixthlist(),
          Seventhlist(),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
