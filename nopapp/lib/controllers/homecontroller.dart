import 'package:get/state_manager.dart';
import 'package:nopapp/models/banner_images.dart';
import 'package:get/get.dart';
import 'package:nopapp/services/remote_service.dart';
import 'base_controller.dart';
import 'package:nopapp/services/home_service.dart';
import 'package:nopapp/Constant/constant.dart';

class HomeController extends GetxController {
  //final HomeServices _homeServices = Get.put(HomeServices());

  var isLoading = true.obs;
  var bannerImage = BannerImages().obs;
  @override
  void onInit() {
    fetchBannerImages();

    super.onInit();
  }

  void fetchBannerImages() async {
    // isLoading(true);
    // print('fetching data from server');
    // showLoading(fetchingData);
    // var bannerImages = await RemoteServices.fetchProducts();
    // // await _homeServices.fetchBannerImages().catchError(handleError);

    // if (bannerImages != null) {
    //   bannerImage.value = bannerImages;
    // }
    // hideLoading();

    try {
      isLoading(true);
      // RemoteServices.fetchProducts();
      var products = await HomeServices.fetchBannerImages();
      if (products != null) {
        bannerImage.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
