import 'package:flutter/material.dart';
import 'package:nopapp/models/banner_images.dart' as banner;

class Secondlist extends StatefulWidget {
  banner.BannerImages _images;

  Secondlist(banner.BannerImages images) {
    this._images = images;
  }

  @override
  _SecondlistState createState() => _SecondlistState();
}

class _SecondlistState extends State<Secondlist> {
  buildItem(banner.Slider slider, BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            slider.pictureUrl,
            height: MediaQuery.of(context).size.height / 4,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        child: ListView.builder(
          itemCount: widget._images.sliders.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return buildItem(widget._images.sliders[index], context, index);
          },
        ),
      ),
    );
  }
}
