import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/phone_number_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:truckoom_shipper/utilities/utilities.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordProvider extends ChangeNotifier {
  BuildContext context;
  var connectivityResult;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  PhoneNumberResponse phoneNumberResponse = PhoneNumberResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  CustomPopup _loader = CustomPopup();

  init(BuildContext context) async {
    this.context = context;
    connectivityResult = "";
  }

  Future onForgotPassword({
    @required BuildContext context,
    @required String email,
  }) async {
    try {
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
      }  else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper
            .post('$forgotPassword' + '$email', headers: {
          'Content-Type': 'application/json',
          // 'Authorization': '$token'
        });
        if (response.statusCode == 200) {
          phoneNumberResponse = PhoneNumberResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (phoneNumberResponse.code == 1) {
            _loader.hideLoader(context);
            print("otpCode:");
            ApplicationToast.getLoginSignupToast(
              context: context,
              text: Strings.passwordUpdatedText,
              onNavigate: () {
                Navigator.pushReplacement(context, SlideRightRoute(page: Login()));
              },
            );
            // Navigator.pop(context);
          } else {
            _loader.hideLoader(context);
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: Strings.error,
                subHeading: phoneNumberResponse.message);
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
