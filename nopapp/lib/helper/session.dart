import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:nopapp/Constant/constant.dart';
import 'package:nopapp/services/remote_service.dart';
import 'package:nopapp/models/token_model.dart';

String getToken_bak() {
  final claimSet =
      new JwtClaim(issuer: 'nopapp', maxAge: const Duration(minutes: 5));

  String token = issueJwtHS256(claimSet, jwtKey);
  print('JWT: "$token"\n');
  return token;
}

Future<String> getToken() async {
  var assestoken = '';
  final TokenModel model = await RemoteServices.getTokenFromAPI();

  if (model != null && model.accessToken != null) {
    assestoken = model.accessToken.toString();
  }

  return assestoken;
}

Future<Map<String, String>> get headers async {
  var t = await getToken();
  return {"Authorization": 'Bearer ' + t, "cookie": "security=true"};
}
