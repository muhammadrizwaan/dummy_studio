
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/login_response.dart';
import 'package:truckoom_shipper/models/api_models/token_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/widgets/loader.dart';

class LoginProvider extends ChangeNotifier {
  BuildContext context;

  LoginResponse loginResponse = LoginResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  TokenResponse tokenResponse = TokenResponse();

  Loader _loader = Loader();
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
        _loader.hideLoader(context);
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
      _loader.showLoader(context: context);
      if(PreferenceUtils.getString(Strings.token).isEmpty){
        await getToken(context, email, password);
      }
      if(PreferenceUtils.getString(Strings.token) != ""){
        token = PreferenceUtils.getString(Strings.token);
        tempToken = "Bearer $token";
      }
      Response response = await dio.post(
        loginApi,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': tempToken
          },
        ),
        data: {
          "Email": email,
          "Password": password,
          "DeviceId": "string"
        },
      );
      if(response.statusCode != 200){
        _loader.hideLoader(context);
        throw ("Invalid credentials");
      }
      if(response.statusCode == 401){
        await getToken(context, email, password);
      }
      if(response.statusCode == 200){
        _loader.hideLoader(context);
        loginResponse = LoginResponse.fromJson(response.data);
      }

    } catch (e){
      print(e.toString());
    }
  }
}
