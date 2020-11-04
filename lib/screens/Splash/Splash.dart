
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/bookLoadDetails/book_load_details.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/businessEditProfile/business_edit_profile.dart';
import 'package:truckoom_shipper/screens/businessProfile/business_profile.dart';
import 'package:truckoom_shipper/screens/checkUserType/check_user.dart';
import 'package:truckoom_shipper/screens/forgotPassword/forgot_password.dart';
import 'package:truckoom_shipper/screens/individualEditProfile/individual_edit_profile.dart';
import 'package:truckoom_shipper/screens/individualProfile/individual_profile.dart';
import 'package:truckoom_shipper/screens/invoiceDetail/invoice_detail.dart';
import 'package:truckoom_shipper/screens/jobDetails/job_details.dart';
import 'package:truckoom_shipper/screens/language/language.dart';
import 'package:truckoom_shipper/screens/login/login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  void onDelay() async{
    await Future.delayed(Duration(seconds: 3), (){
      // Navigator.pushNamed(context, Routes.checkUser);
      Navigator.pushReplacement(context, SlideRightRoute(page: CheckUser()));
    });
  }

  @override
  void initState() {
    super.initState();
     onDelay();
  }
  @override
  Widget build(BuildContext context) {
    AppSizes.initializeSize(context);
    return Container(
      height: AppSizes.height,
      width: AppSizes.width,
      color: AppColors.white,
      child: Center(child: Image(image: AssetImage('assets/png/logo_splash.png')))
    );
  }
}
