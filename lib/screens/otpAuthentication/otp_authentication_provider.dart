import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/generic_decode_encode/generic.dart';
import 'package:truckoom_shipper/models/api_models/phone_number_response.dart';
import 'package:truckoom_shipper/network/api_urls.dart';
import 'package:truckoom_shipper/network/network_helper.dart';
import 'package:truckoom_shipper/network/network_helper_impl.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessSignup/business_signup.dart';
import 'package:truckoom_shipper/screens/signup/sign_up.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';
import 'package:http/http.dart' as http;

class OTPAthenticationProvider extends ChangeNotifier {
  BuildContext context;
  var connectivityResult;
  String token, otpCode;
  CustomPopup _loader = CustomPopup();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  PhoneNumberResponse phoneNumberResponse = PhoneNumberResponse.empty();
  GenericDecodeEncode genericDecodeEncode = GenericDecodeEncode();
  bool isDataFetched = false;

  init(BuildContext context) async {
    this.context = context;
    connectivityResult = "";
    isDataFetched = false;
  }

  Future getOTP({
    @required BuildContext context,
    @required String tag,
    @required String otp,
    @required String cell,
    @required String otp_code,
  }) async {
    try {
      String newOtp = isDataFetched? otpCode : otp;
      if (otp_code == newOtp) {
        if (tag == Strings.indiviual) {
          Navigator.push(context, SlideRightRoute(page: SignUP(cell: cell)));
        } else if (tag == Strings.business) {
          Navigator.push(context,
              SlideRightRoute(page: BusinessSignup(cell: cell)));
        }
      } else {
        ApplicationToast.getErrorToast(
          durationTime: 3,
          heading: Strings.error,
          subHeading: Strings.invalidCode,
        );
      }
    } catch (e) {
      print(e.toString());
      ApplicationToast.getErrorToast(
        durationTime: 3,
        heading: Strings.error,
        subHeading: Strings.somethingWentWrong,
      );
    }
  }

  Future getPhoneNumber(
      {@required BuildContext context,
        @required String phoneNumber,
        }) async {
    try {
      connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: Strings.error,
            subHeading: Strings.internetConnectionError);
      }  else {
        _loader.showLoader(context: context);
        http.Response response = await _networkHelper
            .post('$phoneNumberApi' + '$phoneNumber', headers: {
          'Content-Type': 'application/json',
        });
        if (response.statusCode == 200) {
          phoneNumberResponse = PhoneNumberResponse.fromJson(
              genericDecodeEncode.decodeJson(response.body));
          if (phoneNumberResponse.code == 1) {
            _loader.hideLoader(context);
            otpCode = phoneNumberResponse.result.value;
            isDataFetched = true;
            ApplicationToast.getLoginSignupToast(
              context: context,
              text: "OTP code is: $otpCode",
              onNavigate: (){
              Navigator.pop(context);
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
