
import 'package:flutter/cupertino.dart';
import 'package:truckoom_shipper/contsants/constants.dart';


class BottomTabProvider extends ChangeNotifier{
  BuildContext context;
  int currentIndex = 1;


  init({@required BuildContext context}) async{
    this.context = context;
  }
  setCurrentIndex(int index){
    this.currentIndex = index;
    notifyListeners();
  }


}