import 'package:dio/dio.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
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
  String email, password;

  Dio dio = Dio();
  TokenResponse tokenResponse = TokenResponse.empty();
  CustomPopup _loader = CustomPopup();

  GetToken({
    this.connectivity = "",
    this.token = "",
    this.refreshToken = "",
    this.email = "",
    this.password = ""
});

  Future<String> onToken() async {

    token = await Constants.getToken();

    double previousTime = await PreferenceUtils.getDouble(Strings.tokenTime);

    double ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
    double currentTime = await (((ms / 1000) / 60).round()).toDouble();
    double time = currentTime - previousTime;
    print('time is ');
    print(time);
    print(token);
    print('time is ');
    if (time > 10.0) {
      email = await PreferenceUtils.getString(Strings.email);
      password = await PreferenceUtils.getString(Strings.password);

      try {
        var formData = Map<String, dynamic>();
        formData['username'] = email;
        formData['password'] = password;
        formData['grant_type'] = "password";
        // formData['grant_type'] = "refresh_token";
        // formData['refresh_token'] = refreshToken;
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

          await Constants.setToken(tokenResponse.accessToken);
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