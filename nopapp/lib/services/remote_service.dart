import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nopapp/Constant/constant.dart';
import 'package:nopapp/models/token_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<TokenModel?> getTokenFromAPI() async {
    try {
      var uri = Uri.parse(
          baseAddress + 'token?Username=admin@yourstore.com&Password=admin');
      print('fetching admin token');
      var response = await client
          .get(uri)
          .timeout(const Duration(seconds: 3600), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return tokenModelFromJson(jsonString);
      } else {
        //show error message
        return null;
      }
    } on SocketException {
      print("You are not connected to internet");
    }
  }
}
