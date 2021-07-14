import 'package:nopapp/models/banner_images.dart';
import 'base_client.dart';
import 'package:nopapp/Constant/url_string.dart';

class HomeServices extends BaseClient {
  static Future<BannerImages> fetchBannerImages() async {
    var response = await BaseClient().get(getSliderApi);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return bannerImagesFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
