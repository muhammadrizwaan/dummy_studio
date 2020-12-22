import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/common_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/utilities/utilities.dart';


class SignUpProvider extends ChangeNotifier {
  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  CommonResponse commonResponse = CommonResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  CustomPopup _loader = CustomPopup();
  String deviceId, tempToken;
  double ms;
  double currentTime;
  var connectivity;

  init(BuildContext context) async {
    this.context = context;
    deviceId = "";
    connectivity = "";
  }

  Future getIndividualSignUp({
    @required BuildContext context,
    @required String cell,
    @required String name,
    @required String email,
    @required String password,
    @required String confirmPassword,
    @required bool onCheck,
  }) async {
    try {
      deviceId = await PreferenceUtils.getString(Strings.deviceId);
      connectivity = await (Connectivity().checkConnectivity());
      if (connectivity == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.internetConnectionError,
        );
      } else if (name.isEmpty || name.length < 2) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.nameErrorText,
        );
      } else if (email.validateEmail() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.emailErrorText);
      } else if (password.isEmpty && password.length < 6) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.passwordErrorText,
        );
      } else if (confirmPassword.isEmpty && confirmPassword.length < 6) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.passwordErrorText,
        );
      } else if (password != confirmPassword) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.passwordMatchErrorText,
        );
      } else if (onCheck == false) {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.checkBoxErrorText,
        );
      } else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper.post(
          individualSignUp,
          headers: {
            "Content-Type": "application/json",
          },
          body: {
            "FullName": name,
            "Email": email,
            "Phone": cell,
            "Password": password,
            "DeviceId": deviceId
          },
        );
        if(response.statusCode == 200){
          commonResponse = CommonResponse.fromJson(genericDecodeEncode.decodeJson(response.body));
          if(commonResponse.code == 1){

            await Constants.setToken(commonResponse.result.token.accessToken);
            await Constants.setUserEmail(commonResponse.result.user.email);
            await Constants.setPassword(commonResponse.result.user.password);
            await Constants.setUserId(commonResponse.result.user.userId);
            await Constants.setUserName(commonResponse.result.user.fullName);
            await Constants.setUserPhone(commonResponse.result.user.phone);
            await Constants.setUser(Strings.indiviual);

            ms = ((new DateTime.now()).millisecondsSinceEpoch).toDouble();
            currentTime = await (((ms / 1000) / 60).round()).toDouble();
            await PreferenceUtils.setDouble(Strings.tokenTime, currentTime);
            _loader.hideLoader(context);
            ApplicationToast.getLoginSignupToast(
              context: context,
              text: Strings.signupSuccessful,
              onNavigate: () {
                Navigator.pushAndRemoveUntil(context, SlideRightRoute(page: BottomTab()), ModalRoute.withName(Routes.signup));
              },
            );
          }
          else{
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: commonResponse.message);
          }

        }
        else{
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(durationTime: 3, heading: Strings.error, subHeading: Strings.somethingWentWrong);
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.authorizationErrorText);
      print(e.toString());
    }
  }

}
