
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/login_response.dart';
import 'package:truckoom_shipper/models/api_models/token_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/assets.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  BuildContext context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  LoginResponse loginResponse = LoginResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  TokenResponse tokenResponse = TokenResponse();

  CustomPopup _loader = CustomPopup();
  Dio dio = Dio();
  String token;
  String tempToken;

  init(BuildContext context) async {
    token = "";
    tempToken = "";
    this.context = context;
  }

  Future getToken(BuildContext context, String email, String password) async {
    try {
      var formData = Map<String, dynamic>();
      formData['username'] = "shipperbusiness@jinnbyte.com";
      formData['password'] = "123567";
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
        throw ("Unauthorized");
      } else if (response.statusCode == 200) {
        tokenResponse = TokenResponse.fromJson(response.data);
        PreferenceUtils.setString("token", "String");
//        PreferenceUtils.setString("token", tokenResponse.accessToken.toString());

        print("Stored");
        print("Stored");
        print("Stored");
        print("Stored");
        print("Stored");
        print("Stored");
        print("Stored");
        print("Stored");
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
      if(PreferenceUtils.getString("token").isEmpty){
        await getToken(context, email, password);
      }
      if(PreferenceUtils.getString("token").isNotEmpty){
        token = PreferenceUtils.getString("token");
        tempToken = "Bearer $token";
      }
      http.Response response = await _networkHelper.post(
        loginApi,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': tempToken
        },
        body: {
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
        _loader.hideLoader(context);
      }
      if(response.statusCode == 200){
        _loader.hideLoader(context);
        loginResponse = LoginResponse.fromJson(genericDecodeEncode.decodeJson(response.body));
        ApplicationToast.getSuccessToast(durationTime: 3, heading: "Congratulation", subHeading: "");
        Navigator.pushReplacement(context, SlideRightRoute(page: BottomTab()));
      }

    } catch (e){
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
}
