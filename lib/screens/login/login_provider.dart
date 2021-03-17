

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/common_response.dart';
import 'package:truckoom_shipper/models/api_models/token_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab_provider.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/utilities/utilities.dart';
import 'package:connectivity/connectivity.dart';

class LoginProvider extends ChangeNotifier {
  BuildContext context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  CommonResponse commonResponse = CommonResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  BottomTabProvider _bottomTabProvider;
  TokenResponse tokenResponse = TokenResponse.empty();

  CustomPopup _loader = CustomPopup();
  String deviceId, tempToken;
  double ms;
  double currentTime;
  var connectivityResult;

  init(BuildContext context) async {
    _bottomTabProvider = Provider.of(context, listen: false);
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
      print(deviceId);
      connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else if (email.validateEmail() == false && email.validatePhoneNumber() == false) {
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
          "DeviceId": deviceId,
          "UserTypeId": 2
        });
        if (response.statusCode == 200) {
          commonResponse = CommonResponse.fromJson(genericDecodeEncode.decodeJson(response.body));
          if (commonResponse.code == 1) {
            Constants.setToken(commonResponse.result.token.accessToken);
            await Constants.setUserEmail(commonResponse.result.user.email);
            Constants.setPassword(commonResponse.result.user.password);
            Constants.setUserId(commonResponse.result.user.userId);
            Constants.setUserName(commonResponse.result.user.fullName);
            Constants.setUserImage(commonResponse.result.user.profilePicture);

            Constants.setUserPhone(commonResponse.result.user.phone != null? commonResponse.result.user.phone:"");
            Constants.setUser(commonResponse.result.user.isBusinessAccount? Strings.business: Strings.indiviual);
            Constants.setCityName(commonResponse.result.user.cityName);
            Constants.setCityId(commonResponse.result.user.cityId != null? commonResponse.result.user.cityId:0);
            if(commonResponse.result.user.isBusinessAccount) {
              if (commonResponse.result.user.companyInformation.length > 0) {
                Constants.setCommpanyName(commonResponse.result.user.companyInformation[0].companyName);
                Constants.setCommpanyPhone(commonResponse.result.user.companyInformation[0].contactNumber);
                Constants.setCommpanyTrn(commonResponse.result.user.companyInformation[0].trn);
                Constants.setLicenseExpiryDate('${commonResponse.result.user.companyInformation[0].licenseExpiryDate}');
              }
              await Constants.setLicenseImages(commonResponse.result.user.userDocuments);
            }
            ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
            currentTime = await (((ms / 1000) / 60).round()).toDouble();
            PreferenceUtils.setDouble(Strings.tokenTime, currentTime);
            _loader.hideLoader(context);

            ApplicationToast.getLoginSignupToast(
              context: context,
              text: Strings.loginSuccessful,
              onNavigate: () {
                Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: BottomTab()), ModalRoute.withName(Routes.login));
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
