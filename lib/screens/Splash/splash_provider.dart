
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/commons/utils.dart';

class SplashProvider extends ChangeNotifier{


  BuildContext context;

  init({@required BuildContext context}){
    PreferenceUtils.init();
    this.context = context;
  }
}