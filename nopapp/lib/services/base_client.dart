import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nopapp/helper/app_exceptions.dart';
import 'package:nopapp/Constant/constant.dart';
import 'package:nopapp/helper/session.dart';
import 'package:flutter/material.dart';

class BaseClient {
  static var client = http.Client();
  //GET
  Future<dynamic> get(String api) async {
    var uri = Uri.parse(baseUrl + api);
    var authHeader = await headers;
    try {
      var response = await client
          .get(uri, headers: authHeader)
          .timeout(Duration(seconds: 3600));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    } on HttpException {
      throw HttpException("Couldn't find the API");
    } on FormatException {
      throw BadFormatException("Bad response format");
    }
  }

  //POST
  Future<dynamic> post(String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await client
          .post(uri, body: payload)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //DELETE
  //OTHER

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 404:
        //var responseJson = utf8.decode(response.bodyBytes);
        return response;
        break;
      case 201:
        //var responseJson = utf8.decode(response.bodyBytes);
        return response;
        break;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
