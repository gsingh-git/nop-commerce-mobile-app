import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:nopapp/Constant/constant.dart';
import 'package:nopapp/services/remote_service.dart';
import 'package:nopapp/models/token_model.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:nopapp/helper/string.dart';

String getToken_bak() {
  final claimSet =
      new JwtClaim(issuer: 'nopapp', maxAge: const Duration(minutes: 5));

  String token = issueJwtHS256(claimSet, jwtKey);
  print('JWT: "$token"\n');
  return token;
}

Future<String> getToken() async {
  var assestoken = '';
  final TokenModel? model = await RemoteServices.getTokenFromAPI();

  if (model != null && model.accessToken != null) {
    assestoken = model.accessToken.toString();
  }

  return assestoken;
}

Future<Map<String, String>> get headers async {
  var t = await getToken();
  return {"Authorization": 'Bearer ' + t, "cookie": "security=true"};
}

Future<bool> isNetworkAvailable() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

noIntImage() {
  return SvgPicture.asset(
    'assets/images/no_internet.svg',
    fit: BoxFit.contain,
  );
}

noIntText(BuildContext context) {
  return Container(
      child: Text(NO_INTERNET,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: colors.primary, fontWeight: FontWeight.normal)));
}

noIntDec(BuildContext context) {
  return Container(
    padding: EdgeInsetsDirectional.only(top: 30.0, start: 30.0, end: 30.0),
    child: Text(NO_INTERNET_CONNECTION,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: colors.lightBlack2,
              fontWeight: FontWeight.normal,
            )),
  );
}
