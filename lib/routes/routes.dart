import 'package:truckoom_shipper/screens/Splash/Splash.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/businessEditProfile/business_edit_profile.dart';
import 'package:truckoom_shipper/screens/businessInformation/business_information.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile.dart';
import 'package:truckoom_shipper/screens/businessSignup/business_signup.dart';
import 'package:truckoom_shipper/screens/checkUserType/check_user.dart';
import 'package:truckoom_shipper/screens/contact_us/contact_us.dart';
import 'package:truckoom_shipper/screens/driver_details/driver_details.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password.dart';
import 'package:truckoom_shipper/screens/history/history.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile.dart';
import 'package:truckoom_shipper/screens/individualPayment/individual_payment.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile.dart';
import 'package:truckoom_shipper/screens/invoice/invoice.dart';
import 'package:truckoom_shipper/screens/invoiceDetail/invoice_detail.dart';
import 'package:truckoom_shipper/screens/language/language.dart';
import 'package:truckoom_shipper/screens/loadDetails/load_details.dart';
import 'package:truckoom_shipper/screens/login/login.dart';
import 'package:truckoom_shipper/screens/maps/maps_screen.dart';
import 'package:truckoom_shipper/screens/notifications/notifications.dart';
import 'package:truckoom_shipper/screens/otpAuthentication/otp_authentication.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number.dart';
import 'package:truckoom_shipper/screens/referrals/referrals.dart';
import 'package:truckoom_shipper/screens/resetPassword/reset_password.dart';
import 'package:truckoom_shipper/screens/signup/sign_up.dart';
import 'package:truckoom_shipper/screens/wallet/wallet.dart';

class Routes {
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
  static const String notifications = '/notifications';
  static const String individualProfile = '/individualProfile';
  static const String individualEditProfile = '/individualEditProfile';
  static const String businessProfile = '/businessProfile';
  static const String businessEditProfile = '/businessEditProfile';
  static const String history = '/history';
  static const String invoice = '/invoice';
  static const String referrals = '/referrals';
  static const String wallet = '/wallet';
  static const String contactUs = '/contactUs';
  static const String driverDetails = '/driverDetails';
  static const String loadDetails = '/loadDetails';
  static const String invoiceDetail = '/invoiceDetail';
  static const String maps = '/maps';
  static const String language = '/language';
  static const String individualPayment = '/individualPayment';

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
    notifications: (context) => Notifications(),
    individualProfile: (context) => IndividualProfile(),
    individualEditProfile: (context) => IndividualEditProfile(),
    businessProfile: (context) => BusinessProfile(),
    businessEditProfile: (context) => BusinessEditProfile(),
    history: (context) => History(),
    invoice: (context) => Invoice(),
    referrals: (context) => Referrals(),
    wallet: (context) => Wallet(),
    contactUs: (context) => ContactUs(),
    driverDetails: (context) => DriverDetails(),
    loadDetails: (context) => LoadDetail(),
    invoiceDetail: (context) => InvoiceDetail(),
    maps: (context) => Maps(),
    language: (context) => Language(),
    individualPayment: (context) => IndividualPayment(),
  };
}
