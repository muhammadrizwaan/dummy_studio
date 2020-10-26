
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/routes/routes.dart';
import 'package:truckoom_shipper/screens/checkUserType/check_user.dart';
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
      Navigator.pushReplacement(context, SlideRightRoute(page: Language()));
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
