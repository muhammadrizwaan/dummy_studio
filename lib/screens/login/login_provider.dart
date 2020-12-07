import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/get_token.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/common_response.dart';
import 'package:truckoom_shipper/models/api_models/token_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/utilities/utilities.dart';
import 'package:connectivity/connectivity.dart';

class LoginProvider extends ChangeNotifier {
  BuildContext context;

  NetworkHelper _networkHelper = NetworkHelperImpl();

  // LoginResponse loginResponse = LoginResponse.empty();
  CommonResponse commonResponse = CommonResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  TokenResponse tokenResponse = TokenResponse.empty();

  CustomPopup _loader = CustomPopup();
  Dio dio = Dio();
  String deviceId, tempToken;
  double ms;
  double currentTime;
  var connectivityResult;

  init(BuildContext context) async {
    tempToken = deviceId = "";
    connectivityResult = "";
    this.context = context;
  }


  Future getLogin({
    @required BuildContext context,
    @required String email,
    @required String password,
  }) async {
    try {
      deviceId = await PreferenceUtils.getString(Strings.deviceId);
      connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else if (email.validateEmail() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.emailErrorText);
      } else if (password.isEmpty || password.length < 6) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.passwordErrorText);
      } else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.post(loginApi, headers: {
          'Content-Type': 'application/json',
        }, body: {
          "Email": email,
          "Password": password,
          "DeviceId": deviceId
        });
        if (response.statusCode == 200) {
          commonResponse = CommonResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (commonResponse.code == 1) {
            String res = commonResponse.result.token.accessToken;
            String data = "Bearer $res";
            await PreferenceUtils.setString(Strings.token, data);
            await PreferenceUtils.setString(Strings.refreshToken, commonResponse.result.token.refreshToken);
            await PreferenceUtils.setString(Strings.email, commonResponse.result.user.email);
            await PreferenceUtils.setString(Strings.password, commonResponse.result.user.password);
            ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
            currentTime = await (((ms / 1000) / 60).round()).toDouble();
            await PreferenceUtils.setDouble(Strings.tokenTime, currentTime);
            _loader.hideLoader(context);
            ApplicationToast.getLoginSignupToast(
              context: context,
              text: Strings.loginSuccessful,
              onNavigate: () {
                commonResponse.result.user.isBusinessAccount
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        SlideRightRoute(page: BottomTab(tag: Strings.business)),
                        ModalRoute.withName(Routes.login))
                    : Navigator.pushAndRemoveUntil(
                        context,
                        SlideRightRoute(page: BottomTab(tag: Strings.indiviual)),
                        ModalRoute.withName(Routes.login));
              },
            );
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: commonResponse.message);
          }
        } else {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: Strings.error,
              subHeading: Strings.somethingWentWrong);
        }
      }
    } catch (error) {
      _loader.hideLoader(context);
      print(error.toString());
    }
  }
}
