import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/models/api_models/token_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';

class GetToken{
  var connectivity;
  String token;
  String refreshToken;
  double previousTime;

  Dio dio = Dio();
  TokenResponse tokenResponse = TokenResponse.empty();
  CustomPopup _loader = CustomPopup();

  GetToken({
    this.connectivity = "",
    this.token = "",
    this.refreshToken = "",
});

  Future<String> onToken() async {

    token = await PreferenceUtils.getString(Strings.token);
    double previousTime = await PreferenceUtils.getDouble(Strings.tokenTime);

    double ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
    double currentTime = await (((ms / 1000) / 60).round()).toDouble();
    double time = currentTime - previousTime;

    if (time > 15.0) {
      refreshToken = await PreferenceUtils.getString(Strings.refreshToken);
      print('hello');
      print(refreshToken);

      try {
        var formData = Map<String, dynamic>();
        // formData['username'] = email;
        // formData['password'] = password;
        // formData['grant_type'] = "password";
        formData['grant_type'] = "refresh_token";
        formData['refresh_token'] = refreshToken;
        dio.options.contentType = Headers.formUrlEncodedContentType;
        Response response = await dio.post(
          tokenApi,
          data: formData,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );
        if (response.statusCode == 200) {
          tokenResponse = TokenResponse.fromJson(response.data);
          String tokenRes = tokenResponse.accessToken;
          print('refresh token');
          token = "Bearer $tokenRes";
          await PreferenceUtils.setString(
              Strings.token, token);
          await PreferenceUtils.setString(
              Strings.refreshToken, tokenResponse.refreshToken);
          ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
          currentTime = await (((ms / 1000) / 60).round()).toDouble();
          await PreferenceUtils.setDouble(Strings.tokenTime, currentTime);
          print(token);
        }
        else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: "Unauthorized user");
        }
      } catch (e) {
        print(e.toString());
      }
    }
    return token;
  }
}