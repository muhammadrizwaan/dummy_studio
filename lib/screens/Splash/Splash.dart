
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/res/colors.dart';
import 'package:truckoom_shipper/res/sizes.dart';
import 'package:truckoom_shipper/screens/Splash/splash_provider.dart';
import 'package:truckoom_shipper/screens/language/language.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {
  SplashProvider _provider;


  @override
  void initState() {
    super.initState();
     _provider = Provider.of<SplashProvider>(context, listen:false);
     _provider.init(context: context);
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context, listen:true);
    AppSizes.initializeSize(context);
    return Container(
      height: AppSizes.height,
      width: AppSizes.width,
      color: AppColors.white,
      child: Center(
          child: Container(
              width: AppSizes.width*0.8,
              child: Image(image: AssetImage('assets/png/logo_splash.png'))))
    );
  }
}
