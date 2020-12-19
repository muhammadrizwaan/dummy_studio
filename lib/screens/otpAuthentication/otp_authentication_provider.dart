import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/businessSignup/business_signup.dart';
import 'package:truckoom_shipper/screens/signup/sign_up.dart';
import 'package:truckoom_shipper/utilities/toast.dart';
import 'package:truckoom_shipper/widgets/loader.dart';

class OTPAthenticationProvider extends ChangeNotifier {
  BuildContext context;

  CustomPopup _loader = CustomPopup();

  init(BuildContext context) async {
    this.context = context;
  }

  Future getOTP({
    @required BuildContext context,
    @required String tag,
    @required String otp,
    @required String cell,
    @required String otp_code,
  }) async {
    try {
      if (otp == otp_code) {
        if (tag == Strings.indiviual) {
          Navigator.push(context, SlideRightRoute(page: SignUP(tag: tag, cell: cell)));
        } else if (tag == Strings.business) {
          Navigator.push(context,
              SlideRightRoute(page: BusinessSignup(tag: tag, cell: cell)));
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
}
