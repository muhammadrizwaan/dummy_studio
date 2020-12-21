import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/phone_number_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/otpAuthentication/otp_authentication.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:truckoom_shipper/utilities/utilities.dart';
class PhoneNumberProvider extends ChangeNotifier {
  BuildContext context;
  var connectivityResult;
  String token, otpCode;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  PhoneNumberResponse phoneNumberResponse = PhoneNumberResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  CustomPopup _loader = CustomPopup();
  Dio dio = Dio();

  init(BuildContext context) async {
    this.context = context;
    token = otpCode = "";
    connectivityResult = "";
  }

  Future getPhoneNumber(
      {@required BuildContext context,
      @required String phoneNumber,
      @required String tag,
      @required bool onCheck}) async {
    try {
      connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      } else if (phoneNumber.validatePhoneNumber() == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.phoneNumberErrorText);
      } else if (onCheck == false) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.checkBoxErrorText);
      } else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper
            .post('$phoneNumberApi' + '$phoneNumber', headers: {
          'Content-Type': 'application/json',
          // 'Authorization': '$token'
        });
        if (response.statusCode == 200) {
          phoneNumberResponse = PhoneNumberResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (phoneNumberResponse.code == 1) {
            _loader.hideLoader(context);
            otpCode = phoneNumberResponse.result.value;
            print("otpCode:");
            print(otpCode);
            ApplicationToast.getLoginSignupToast(context: context, text: "OTP code is: $otpCode", onNavigate: (){
              Navigator.push(context, SlideRightRoute(page: OTPAuthentication(
                  tag: tag, otp: otpCode, cell: phoneNumber)),
              );
            },
            );

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
