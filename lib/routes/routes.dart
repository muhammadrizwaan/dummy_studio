

import 'package:truckoom_shipper/screens/Splash/Splash.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/businessInformation/business_information.dart';
import 'package:truckoom_shipper/screens/businessSignup/business_signup.dart';
import 'package:truckoom_shipper/screens/checkUserType/check_user.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/screens/otpAuthentication/otp_authentication.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number.dart';
import 'package:truckoom_shipper/screens/resetPassword/reset_password.dart';
import 'package:truckoom_shipper/screens/signup/sign_up.dart';

class Routes{
  static const String splash = '/';
  static const String checkUser = '/checkUser';
  static const String login = '/login';
  static const String phone = '/phone';
  static const String otpAuthentication = '/otpAuthentication';
  static const String signup = '/signup';
  static const String forget = '/forget';
  static const String reset = '/reset';
  static const String businessSignup = '/businessSignup';
  static const String businessInformation = '/businessInformation';
  static const String bottomTab = '/bottomTab';


  static final routes = {
      splash: (context) => Splash(),
      checkUser: (context) => CheckUser(),
      login: (context) => Login(),
      phone: (context) => PhoneNumber(),
      otpAuthentication: (context) => OTPAuthentication(),
      signup: (context) => SignUP(),
      forget: (context) => ForgotPassowrd(),
      reset: (context) => ResetPassword(),
      businessSignup: (context) => BusinessSignup(),
      businessInformation: (context) => BusinessInformation(),
      bottomTab: (context) => BottomTab(),
  };
}
