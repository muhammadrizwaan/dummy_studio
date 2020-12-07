
import 'package:flutter/cupertino.dart';

class BottomTabProvider extends ChangeNotifier{
  BuildContext context;
  int currentIndex = 0;

  init({@required BuildContext context}) async{
    this.context = context;
  }

  setCurrentIndex(int index){
    this.currentIndex = index;
    notifyListeners();
  }
}