
import 'dart:io' as io;
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/animations/slide_right.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/contsants/constants.dart';
import 'package:truckoom_shipper/res/strings.dart';
import 'package:truckoom_shipper/screens/bottomTab/bottom_tab.dart';
import 'package:truckoom_shipper/screens/language/language.dart';

class SplashProvider extends ChangeNotifier{

  DeviceInfoPlugin devicInfo = DeviceInfoPlugin();

  BuildContext context;

  String userType;

  init({@required BuildContext context}) async{
    PreferenceUtils.init();
    this.context = context;
    await getDeviceInfo();
    userType = "";
    await navigateToNextScreen();
  }
  Future getDeviceInfo() async {
    if (io.Platform.isIOS) {
      IosDeviceInfo iosInfo = await devicInfo.iosInfo;
      await PreferenceUtils.setString(Strings.deviceId, iosInfo.identifierForVendor);
    } else {
      AndroidDeviceInfo deviceInfo = await devicInfo.androidInfo;
      await PreferenceUtils.setString(Strings.deviceId, deviceInfo.androidId);
    }
  }
  void navigateToNextScreen() async {
    await Future.delayed(Duration(
      seconds: 4,
    ));
    if(Constants.getUserEmail().isNotEmpty && Constants.getPassword().isNotEmpty){
      Navigator.pushReplacement(context, SlideRightRoute(page: BottomTab()));
    }else{
      Navigator.pushReplacement(context, SlideRightRoute(page: Language()));
    }
  }
}