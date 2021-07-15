import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nopapp/models/banner_images.dart' as banner;

class HomeSlider extends StatefulWidget {
  banner.BannerImages _images;

  HomeSlider(banner.BannerImages images) {
    this._images = images;
  }

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  buildItem(banner.Slider slider, BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            imageUrl: slider.pictureUrl,
            height: MediaQuery.of(context).size.height / 4,
            errorWidget: (context, url, error) => Icon(Icons.error),
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
