// To parse this JSON data, do
//
//     final bannerImages = bannerImagesFromJson(jsonString);

import 'dart:convert';

BannerImages bannerImagesFromJson(String str) =>
    BannerImages.fromJson(json.decode(str));

String bannerImagesToJson(BannerImages data) => json.encode(data.toJson());

class BannerImages {
  BannerImages({
    this.sliders,
  });

  List<Slider> sliders;

  factory BannerImages.fromJson(Map<String, dynamic> json) => BannerImages(
        sliders:
            List<Slider>.from(json["sliders"].map((x) => Slider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sliders": List<dynamic>.from(sliders.map((x) => x.toJson())),
      };
}

class Slider {
  Slider({
    this.pictureUrl,
    this.text,
    this.link,
  });

  String pictureUrl;
  String text;
  String link;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        pictureUrl: json["picture_url"],
        text: json["text"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "picture_url": pictureUrl,
        "text": text,
        "link": link,
      };
}
