
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/login_response.dart';
import 'package:truckoom_shipper/models/api_models/token_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  BuildContext context;

  LoginResponse loginResponse = LoginResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  // TokenResponse tokenResponse = TokenResponse();
  TokenResponse tokenResponse = TokenResponse.empty();

  CustomPopup _loader = CustomPopup();
  Dio dio = Dio();
  String token = "";
  String tempToken = "";

  init(BuildContext context) async {
    PreferenceUtils.init();
    this.context = context;
  }

  Future getToken(BuildContext context, String email, String password) async {
    try {
      var formData = Map<String, dynamic>();
      formData['username'] = email;
      formData['password'] = password;
      formData['grant_type'] = "password";
      dio.options.contentType = Headers.formUrlEncodedContentType;
      Response response = await dio.post(
        tokenApi,
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      if (response.statusCode != 200) {
        // _loader.hideLoader(context);
        throw ("Unauthorized");
      } else if (response.statusCode == 200) {
        tokenResponse = TokenResponse.fromJson(response.data);
        PreferenceUtils.setString(Strings.token, tokenResponse.accessToken);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getLogin(
      {@required BuildContext context,
      @required String email,
      @required String password}) async{
    try{
      // _loader.showLoader(context: context);
      if(PreferenceUtils.getString(Strings.token).isEmpty){
        await getToken(context, email, password);
      }
      if(PreferenceUtils.getString(Strings.token) != null){
        token = PreferenceUtils.getString(Strings.token);
        tempToken = "Bearer $token";
      }
      // tempToken = "Bearer 1P0e5NEMQqGDvAyYveTGPjw4pZXyX9vO5a6QiYUm-2-frTCIVUZNNakK9k3lW7Nibrqp5gfDpHbQkqpBUALAAAYjtgI1EbrPLsaMVNwS2GiXNtvHODyv7jUYjurc9B6G2fvN5JStUu8NsGzcTQYz_ZqdEyKuyOvfkYEBSCltGyG9dgWpFfY7IIiA_9XWt1RICfdGcyLaE5acgD2bQJXSuskheKupv3vlGY8wTzJcIAyESwwvXxutALr1HGAIBuEXk1qSYYHusAca7tyRHWBeuiCYF164qS_NSNdWlI6_0k7vtW7pcIGcs4JCmhF2RoJYkzH840NBJOQepc6AUtajVA";
      Response response = await dio.post(
        loginApi,
        data: {
          "Email": email,
          "Password": password,
          "DeviceId": "string"
        },
      );
      if(response.statusCode != 200){
        // _loader.hideLoader(context);
        throw ("Invalid credentials");
      }
      if(response.statusCode == 401){
        await getToken(context, email, password);
      }
      if(response.statusCode == 200){
        // _loader.hideLoader(context);
        loginResponse = LoginResponse.fromJson(response.data);
      }

    } catch (e){
      print(e.toString());
    }
  }
}
