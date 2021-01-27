import 'package:dio/dio.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/common_response.dart';
import 'package:truckoom_shipper/models/api_models/token_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class GetToken{
  var connectivity;
  // String token;
  String refreshToken;
  double previousTime;
  String email, password, deviceId;

  Dio dio = Dio();
  TokenResponse tokenResponse = TokenResponse.empty();
  CustomPopup _loader = CustomPopup();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  CommonResponse commonResponse = CommonResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();

  GetToken({
    this.connectivity = "",
    // this.token = "",
    this.refreshToken = "",
    this.email = "",
    this.password = "",
    this.deviceId =""
});

  Future<String> onToken() async {
    String token;
    double previousTime = await PreferenceUtils.getDouble(Strings.tokenTime);
    double ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
    double currentTime = await (((ms / 1000) / 60).round()).toDouble();
    double time = currentTime - previousTime;
    print('time is ');
    print(time);


    if (time > 10.0) {
      email = await Constants.getUserEmail();
      password = await Constants.getPassword();
      deviceId = await PreferenceUtils.getString(Strings.deviceId);

      // print('email and password');
      //
      // print(Constants.getToken());
      // print(email);
      // print(password);

      try {
        http.Response response = await _networkHelper.post(loginApi, headers: {
          'Content-Type': 'application/json',
        }, body: {
          "Email": email,
          "Password": password,
          "DeviceId": deviceId,
          "UserTypeId": 2
        });
        if (response.statusCode == 200) {
          commonResponse = CommonResponse.fromJson(genericDecodeEncode.decodeJson(response.body));
          if (commonResponse.code == 1) {
            token ="Bearer ${commonResponse.result.token.accessToken}";
            // print('Token updated');
            await Constants.setToken(commonResponse.result.token.accessToken);
            ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
            currentTime = await (((ms / 1000) / 60).round()).toDouble();
            PreferenceUtils.setDouble(Strings.tokenTime, currentTime);
            // print(token);
            // return token;
        }}
        else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: "Unauthorized user");
        }
      } catch (e) {
        print(e.toString());
      }
    }
    else{
      token = await Constants.getToken();
      print('Token not updated');
      print(token);

    }
    return token;


    // token = await Constants.getToken();
    //
    // double previousTime = await PreferenceUtils.getDouble(Strings.tokenTime);
    //
    // double ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
    // double currentTime = await (((ms / 1000) / 60).round()).toDouble();
    // double time = currentTime - previousTime;
    // print('time is ');
    // print(time);
    // print(token);
    // if (time > 10.0) {
    //   email = Constants.getUserEmail();
    //   password = Constants.getPassword();
    //   print('email and password');
    //   print(email);
    //   print(password);
    //
    //   try {
    //     var formData = Map<String, dynamic>();
    //     formData['username'] = email;
    //     formData['password'] = password;
    //     formData['grant_type'] = "password";
    //     // formData['grant_type'] = "refresh_token";
    //     // formData['refresh_token'] = refreshToken;
    //     // dio.options.contentType = Headers.formUrlEncodedContentType;
    //     Response response = await dio.post(
    //       tokenApi,
    //       data: formData,
    //       options: Options(
    //         contentType: Headers.formUrlEncodedContentType,
    //       ),
    //     );
    //     if (response.statusCode == 200) {
    //       tokenResponse = TokenResponse.fromJson(response.data);
    //       print('Token updated');
    //       await Constants.setToken(tokenResponse.accessToken);
    //       ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
    //       currentTime = await (((ms / 1000) / 60).round()).toDouble();
    //       PreferenceUtils.setDouble(Strings.tokenTime, currentTime);
    //       print(token);
    //     }
    //     else{
    //       ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: "Unauthorized user");
    //     }
    //   } catch (e) {
    //     print(e.toString());
    //   }
    // }
    // return token;
  }
}