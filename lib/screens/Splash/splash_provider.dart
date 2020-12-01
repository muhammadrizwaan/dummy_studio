
import 'dart:io' as io;
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/utils.dart';
import 'package:truckoom_shipper/res/strings.dart';

class SplashProvider extends ChangeNotifier{

  DeviceInfoPlugin devicInfo = DeviceInfoPlugin();

  BuildContext context;

  init({@required BuildContext context}){
    PreferenceUtils.init();
    this.context = context;
    getDeviceInfo();
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
}