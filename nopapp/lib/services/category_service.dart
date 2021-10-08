import 'base_client.dart';
import 'package:nopapp/Constant/url_string.dart';
import 'package:nopapp/models/category_model.dart';

class CategoryServices extends BaseClient {
  static Future<CategoryModel?> fetchHomeCategories() async {
    var response = await BaseClient().get(getCategoryApi);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return categoryModelFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
