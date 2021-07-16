import 'package:nopapp/helper/app_exceptions.dart';
import 'package:nopapp/helper/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class BaseController {
  void handleError(error) {
    hideLoading();
    print('handling error');
    var getdata1 = json.decode(error);
    debugPrint('handling error: $getdata1');
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message!);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErroDialog(description: message!);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErroDialog(
          description: 'Oops! It took longer to respond.');
    } else {
      DialogHelper.showErroDialog(description: 'Oops! Something Went Wrong.');
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message!);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
