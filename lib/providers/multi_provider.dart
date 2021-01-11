import 'package:provider/provider.dart';
import 'package:truckoom_shipper/screens/Splash/splash_provider.dart';
import 'package:truckoom_shipper/screens/addLoad/add_load_provider.dart';
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_detail_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/book_load/book_load_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/history/history_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/accepted/accepted_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/cancelled/cancelled.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/cancelled/cancelled_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/dispatch/dispatch_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/in_process/in_process_provider.dart';
import 'package:truckoom_shipper/screens/bottomTab/pages/my_jobs/tab_bar_view/placed/placed_provider.dart';
import 'package:truckoom_shipper/screens/businessEditProfile/business_edit_profile_provider.dart';
import 'package:truckoom_shipper/screens/businessInformation/business_information_provider.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile_provider.dart';
import 'package:truckoom_shipper/screens/businessSignup/business_signup_provider.dart';
import 'package:truckoom_shipper/screens/checkUserType/check_user_provider.dart';
import 'package:truckoom_shipper/screens/confirmBookLoad/confirm_book_load_Provider.dart';
import 'package:truckoom_shipper/screens/contact_us/contact_us_provider.dart';
import 'package:truckoom_shipper/screens/driver_details/driver_details_provider.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password_provider.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile_provider.dart';
import 'package:truckoom_shipper/screens/individualPayment/individual_payment_provider.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile_provider.dart';
import 'package:truckoom_shipper/screens/invoice/invoice_provider.dart';
import 'package:truckoom_shipper/screens/invoiceDetail/invoice_detail_provider.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details_provider.dart';
import 'package:truckoom_shipper/screens/language/language_provider.dart';
import 'package:truckoom_shipper/screens/login/login_provider.dart';
import 'package:truckoom_shipper/screens/notifications/notifications_provider.dart';
import 'package:truckoom_shipper/screens/otpAuthentication/otp_authentication_provider.dart';
import 'package:truckoom_shipper/screens/payment/payment_provider.dart';
import 'package:truckoom_shipper/screens/phoneNumber/phone_number_provider.dart';
import 'package:truckoom_shipper/screens/referrals/referrals_provider.dart';
import 'package:truckoom_shipper/screens/resetPassword/reset_password_provider.dart';
import 'package:truckoom_shipper/screens/select_vehicle/select_vehicle_provider.dart';
import 'package:truckoom_shipper/screens/signup/sign_up_provider.dart';
import 'package:truckoom_shipper/screens/wallet/wallet_provier.dart';

final multiProviders = [
  ChangeNotifierProvider<SplashProvider>(
    create: (_) => SplashProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<LoginProvider>(
    create: (_) => LoginProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BottomTabProvider>(
    create: (_) => BottomTabProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BusinessEditProfileProvider>(
    create: (_) => BusinessEditProfileProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BusinessProfileProvider>(
    create: (_) => BusinessProfileProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BusinessSignupProvider>(
    create: (_) => BusinessSignupProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<CheckUserProvider>(
    create: (_) => CheckUserProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ContactUsProvider>(
    create: (_) => ContactUsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<DriverDetailProvider>(
    create: (_) => DriverDetailProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ForgotPasswordProvider>(
    create: (_) => ForgotPasswordProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<IndividualEditProfileProvider>(
    create: (_) => IndividualEditProfileProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<IndividualProfileProvider>(
    create: (_) => IndividualProfileProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<InvoiceProvider>(
    create: (_) => InvoiceProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<InvoiceDetailProvider>(
    create: (_) => InvoiceDetailProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<LanguageProvier>(
    create: (_) => LanguageProvier(),
    lazy: true,
  ),
  ChangeNotifierProvider<AddLoadProvider>(
    create: (_) => AddLoadProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<LoginProvider>(
    create: (_) => LoginProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<NotificationProvider>(
    create: (_) => NotificationProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<OTPAthenticationProvider>(
    create: (_) => OTPAthenticationProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PaymentProvider>(
    create: (_) => PaymentProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PhoneNumberProvider>(
    create: (_) => PhoneNumberProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ReferralsProvider>(
    create: (_) => ReferralsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ResetPasswordProvider>(
    create: (_) => ResetPasswordProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<WalletProvider>(
    create: (_) => WalletProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<IndividualPaymentProvider>(
    create: (_) => IndividualPaymentProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<JobDetailsProvider>(
    create: (_) => JobDetailsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BookLoadDetailProvider>(
    create: (_) => BookLoadDetailProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ConfirmBookLoadProvider>(
    create: (_) => ConfirmBookLoadProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SignUpProvider>(
    create: (_) => SignUpProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BusinessInformationProvider>(
    create: (_) => BusinessInformationProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<PlacedProvider>(
    create: (_) => PlacedProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<AcceptedProvider>(
    create: (_) => AcceptedProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<InProcessProvider>(
    create: (_) => InProcessProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<DispatchedProvider>(
    create: (_) => DispatchedProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<CancelledProvider>(
    create: (_) => CancelledProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<HistoryProvider>(
    create: (_) => HistoryProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SelectVehicleProvider>(
    create: (_) => SelectVehicleProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<BookLoadProvider>(
    create: (_) => BookLoadProvider(),
    lazy: true,
  ),
];
