
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class MapsProvider extends ChangeNotifier {
  BuildContext context;
  Position position;
  init({@required BuildContext context}) async {
    this.context = context;
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}